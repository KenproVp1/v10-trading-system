from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from model import predict
from alert import send_alert
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="V10 Trading Profit System", version="1.0")

# Enable CORS for Streamlit dashboard
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    """Root endpoint - redirect to health or docs"""
    return RedirectResponse(url="/docs")

@app.get("/health")
async def health():
    """Health check endpoint."""
    return {"status": "healthy", "service": "V10 Trading API"}

@app.get("/analyze/{symbol}")
async def analyze(symbol: str):
    """Analyze a stock symbol and return trading signal."""
    if not symbol or len(symbol) == 0:
        raise HTTPException(status_code=400, detail="Symbol cannot be empty")
    
    try:
        symbol = symbol.upper().strip()
        result = predict(symbol)
        
        # Integrate alert system
        send_alert(result)
        
        logger.info(f"Analysis completed for {symbol}: {result['signal']}")
        return result
    except Exception as e:
        logger.error(f"Error analyzing {symbol}: {str(e)}")
        raise HTTPException(status_code=500, detail="Analysis failed")
