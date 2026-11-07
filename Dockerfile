# Use official Python 3.10.11 image
FROM python:3.10.11-slim

# Set work directory
WORKDIR /app

# Install system dependencies (if needed, can be removed if not using any OS deps)
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update -o Acquire::Retries=3 && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*
# Copy requirements (if you use one)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Run the Extractor module
CMD ["sh", "-c", "python -m Extractor"]
