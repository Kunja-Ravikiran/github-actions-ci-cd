FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency file first (leverages Docker layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app/ app/

# Expose application port
EXPOSE 5000

# Start the application
CMD ["python", "app/app.py"]
