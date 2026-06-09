FROM python:3.11-slim

WORKDIR /app

# Suppress pip warnings
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Only expose 8501 (Streamlit)
EXPOSE 8501

# Health check - check Streamlit
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8501/_stcore/health', timeout=5)" || exit 1

# Create entrypoint script
RUN echo '#!/bin/bash\n\
set -e\n\
echo "Starting API..."\n\
python -m uvicorn api:app --host 127.0.0.1 --port 8000 > /tmp/api.log 2>&1 &\n\
API_PID=$!\n\
echo "API PID: $API_PID"\n\
sleep 3\n\
echo "Checking API health..."\n\
curl -f http://127.0.0.1:8000/health || exit 1\n\
echo "API is healthy. Starting Streamlit..."\n\
python -m streamlit run dashboard.py --server.port 8501 --server.address 0.0.0.0 --logger.level=info --client.showErrorDetails=false\n\
' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
