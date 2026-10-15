const axios = require('axios');
const FormData = require('form-data');
const fs = require('fs');
require('dotenv').config();

/**
 * Membandingkan dua foto wajah menggunakan AI Microservice (DeepFace FastAPI)
 * dengan fallback ke Face++ API atau mock development.
 *
 * @param {string} imagePath1 - Path absolut foto pertama (foto master / referensi)
 * @param {string} imagePath2 - Path absolut foto kedua (foto absensi yang baru diambil)
 * @returns {Promise<{ confidence: number, thresholds: object, verified?: boolean, distance?: number }>}
 *   - confidence: Tingkat kemiripan wajah (0-100)
 *   - thresholds: Threshold dari AI Microservice / Face++
 * @throws {Error} Jika AI service gagal atau wajah tidak terdeteksi
 */
const compareFaces = async (imagePath1, imagePath2) => {
  const aiServiceUrl = process.env.AI_SERVICE_URL || 'http://127.0.0.1:8000';
  const apiKey = process.env.FACEPP_API_KEY;
  const apiSecret = process.env.FACEPP_API_SECRET;
  const compareUrl = process.env.FACEPP_COMPARE_URL;

  // ──────────────────────────────────────────────
  // 1. Integrasi Utama: AI Microservice (ai-service DeepFace)
  // ──────────────────────────────────────────────
  if (aiServiceUrl) {
    try {
      const formData = new FormData();
      formData.append('captured_image', fs.createReadStream(imagePath2));
      formData.append('master_image', fs.createReadStream(imagePath1));
      // Alias compatibility
      formData.append('image_file1', fs.createReadStream(imagePath1));
      formData.append('image_file2', fs.createReadStream(imagePath2));

      const cleanAiUrl = aiServiceUrl.replace(/\/+$/, '');
      const response = await axios.post(`${cleanAiUrl}/compare`, formData, {
        headers: {
          ...formData.getHeaders(),
        },
        timeout: 30000,
        validateStatus: (status) => status < 500,
      });

      const data = response.data;

      // Jika AI service mengembalikan status gagal (contoh wajah tidak terdeteksi)
      if (data && data.success === false) {
        throw new Error(data.error || data.message || 'Wajah tidak terdeteksi pada gambar. Pastikan foto menampilkan wajah dengan jelas.');
      }

      if (data && typeof data.confidence === 'number') {
        const thresholdVal = typeof data.threshold === 'number' ? data.threshold : 50.0;
        return {
          confidence: Math.round(data.confidence * 100) / 100,
          verified: Boolean(data.verified),
          distance: data.distance,
          thresholds: data.thresholds || {
            '1e-3': thresholdVal,
            '1e-4': 70.0,
            '1e-5': 80.0,
          },
        };
      }
    } catch (aiErr) {
      // Jika error wajah tidak terdeteksi dari AI Service, langsung lemparkan
      if (
        aiErr.message &&
        (aiErr.message.includes('Wajah tidak terdeteksi') ||
          aiErr.message.includes('wajah tidak terdeteksi'))
      ) {
        throw aiErr;
      }

      console.warn(`⚠️ [AI Service] Gagal menghubungi ${aiServiceUrl}: ${aiErr.message}. Mengecek fallback...`);

      // Cek apakah ada konfigurasi Face++ atau Mock dev sebagai fallback
      const hasFacePP = apiKey && apiSecret && apiKey !== 'your_facepp_api_key' && apiSecret !== 'your_facepp_api_secret';
      if (!hasFacePP) {
        if (process.env.NODE_ENV === 'development' || process.env.MOCK_FACE_RECOGNITION === 'true') {
          if (process.env.MOCK_FACE_NOT_MATCH === 'true') {
            console.log('ℹ️ [Dev Mode] Simulasi pengenalan wajah: Not Match (Confidence: 38.5%).');
            return {
              confidence: 38.5,
              thresholds: {
                '1e-3': 60.0,
                '1e-4': 70.0,
                '1e-5': 80.0,
              },
            };
          }
          console.log('ℹ️ [Dev Mode] Simulasi pengenalan wajah aktif (Confidence: 94.8%).');
          return {
            confidence: 94.8,
            thresholds: {
              '1e-3': 60.0,
              '1e-4': 70.0,
              '1e-5': 80.0,
            },
          };
        }
        throw new Error(`Gagal menghubungi AI Face Recognition service (${aiServiceUrl}). Pastikan service AI berjalan.`);
      }
    }
  }

  // ──────────────────────────────────────────────
  // 2. Fallback: Face++ API
  // ──────────────────────────────────────────────
  const isDummyKey =
    !apiKey ||
    !apiSecret ||
    apiKey === 'your_facepp_api_key' ||
    apiSecret === 'your_facepp_api_secret';

  // Fallback simulasi jika key belum diset atau diaktifkan untuk development/testing
  if (isDummyKey || process.env.MOCK_FACE_RECOGNITION === 'true') {
    if (process.env.NODE_ENV === 'development' || isDummyKey || process.env.MOCK_FACE_RECOGNITION === 'true') {
      if (process.env.MOCK_FACE_NOT_MATCH === 'true') {
        console.log('ℹ️ [Dev Mode] Simulasi pengenalan wajah: Not Match (Confidence: 38.5%).');
        return {
          confidence: 38.5,
          thresholds: {
            '1e-3': 60.0,
            '1e-4': 70.0,
            '1e-5': 80.0,
          },
        };
      }
      console.log('ℹ️ [Dev Mode] Simulasi pengenalan wajah aktif (Confidence: 94.8%).');
      return {
        confidence: 94.8,
        thresholds: {
          '1e-3': 60.0,
          '1e-4': 70.0,
          '1e-5': 80.0,
        },
      };
    }
    throw new Error('Face recognition service belum dikonfigurasi.');
  }

  const formData = new FormData();
  formData.append('api_key', apiKey);
  formData.append('api_secret', apiSecret);
  formData.append('image_file1', fs.createReadStream(imagePath1));
  formData.append('image_file2', fs.createReadStream(imagePath2));

  try {
    const response = await axios.post(compareUrl, formData, {
      headers: {
        ...formData.getHeaders(),
      },
      timeout: 30000,
    });

    const { confidence, thresholds } = response.data;

    if (confidence === undefined) {
      throw new Error('Wajah tidak terdeteksi pada salah satu atau kedua foto.');
    }

    return {
      confidence: Math.round(confidence * 100) / 100,
      thresholds,
    };
  } catch (error) {
    if (error.response && error.response.data) {
      const faceError = error.response.data;
      if (faceError.error_message) {
        throw new Error(`Face++ API Error: ${faceError.error_message}`);
      }
    }
    throw new Error(`Gagal melakukan perbandingan wajah: ${error.message}`);
  }
};

module.exports = { compareFaces };
