FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "bot.py"]
