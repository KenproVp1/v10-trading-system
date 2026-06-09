FROM python:3.11-slim

WORKDIR /app

# Suppress pip warnings and upgrade pip
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Only expose Streamlit (8501)
# API runs internally, Streamlit is the frontend
EXPOSE 8501

# Health check for Streamlit
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8501', timeout=5)" || exit 1

# Run both services: API in background, Streamlit in foreground
CMD python -m uvicorn api:app --host 127.0.0.1 --port 8000 &\
    sleep 2 &&\
    python -m streamlit run dashboard.py --server.port 8501 --server.address 0.0.0.0 --logger.level=info --client.showErrorDetails=false
