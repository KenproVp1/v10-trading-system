FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose ports
EXPOSE 8000 8501

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8000/health')" || exit 1

# Run both services with a simple script
CMD ["sh", "-c", "python -m uvicorn api:app --host 0.0.0.0 --port 8000 & python -m streamlit run dashboard.py --server.port 8501 --server.address 0.0.0.0"]
