FROM python:3.10-slim

# Optimasi python output
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install dependensi sistem dasar
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Salin dependencies & install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Salin aplikasi
COPY . .

# Buat folder temp
RUN mkdir -p temp

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
