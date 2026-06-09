FROM python:3.11-slim

WORKDIR /app

# Install dependencies with no cache and suppress warnings
RUN pip install --no-cache-dir --disable-pip-version-check -U pip setuptools

COPY requirements.txt .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# Copy application files
COPY . .

# Expose ports
EXPOSE 8000 8501

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8000/health', timeout=5)" || exit 1

# Create startup script
RUN echo '#!/bin/bash\n\
set -e\n\
echo "Starting V10 Trading System..."\n\
python -m uvicorn api:app --host 0.0.0.0 --port 8000 &\n\
API_PID=$!\n\
echo "API started with PID: $API_PID"\n\
sleep 2\n\
python -m streamlit run dashboard.py --server.port 8501 --server.address 0.0.0.0 --logger.level=info\n\
' > /app/start.sh && chmod +x /app/start.sh

# Run startup script
CMD ["/app/start.sh"]
