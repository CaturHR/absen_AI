FROM python:3.10-slim

# Optimasi python output
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install build tools & runtime libraries untuk Python C-extensions (numpy, opencv, deepface)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    curl \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, dan wheel agar selalu menggunakan pre-built binary wheels
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Salin dependencies & install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Salin aplikasi
COPY . .

# Buat folder temp
RUN mkdir -p temp

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
