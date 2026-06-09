# V10 Trading Profit System
Trading analysis system using FastAPI + Streamlit. Provides AI-driven buy/sell signals for Vietnamese stocks.

## Features
- FastAPI backend with trading prediction API
- Streamlit interactive dashboard
- Real-time trading signals (BUY/WATCH/SELL)
- Alert system for trading opportunities
- Docker support for production deployment

## Quick Start

### Local Development
```bash
# Install dependencies
pip install -r requirements.txt

# Terminal 1: Start API
python -m uvicorn api:app --reload

# Terminal 2: Start Dashboard
python -m streamlit run dashboard.py
```

Access:
- API: http://127.0.0.1:8000
- Dashboard: http://127.0.0.1:8501
- API Docs: http://127.0.0.1:8000/docs

### Docker (Production)
```bash
docker-compose up -d
```

## API Endpoints

- `GET /health` - Health check
- `GET /analyze/{symbol}` - Analyze stock symbol (e.g., FPT, VNM)

## Trading Signals
- **BUY** (🚀): Score > 0.8 - Strong buy signal
- **WATCH** (👁️): Score 0.6-0.8 - Monitor position
- **SELL** (⚠️): Score < 0.6 - Exit signal

## Project Structure
```
.
├── api.py              # FastAPI backend
├── dashboard.py        # Streamlit frontend
├── model.py            # ML prediction engine
├── alert.py            # Alert system
├── requirements.txt    # Python dependencies
├── Dockerfile          # Docker image config
├── docker-compose.yml  # Multi-container setup
└── README.md           # This file
```

## Deployment

### Option 1: Render (Recommended)
1. Push code to GitHub
2. Connect GitHub repo to Render
3. Set Build Command: `pip install -r requirements.txt`
4. Set Start Command: `python -m streamlit run dashboard.py --server.port 10000`
5. Deploy

### Option 2: Railway.app
1. Push code to GitHub
2. Import project from GitHub on Railway
3. Auto-deploys on push

### Option 3: Docker (Any VPS/Cloud)
```bash
docker-compose up -d
```

## Technologies
- **Backend**: FastAPI, Uvicorn
- **Frontend**: Streamlit
- **ML**: scikit-learn, pandas
- **Deployment**: Docker, Docker Compose

## License
MIT

## Support
For issues or questions, create an issue on GitHub.
