import random
from typing import Dict

def predict(symbol: str) -> Dict:
    """
    Generate trading signal for a stock symbol.
    
    Args:
        symbol: Stock ticker symbol (e.g., 'FPT', 'VNM')
    
    Returns:
        Dictionary with symbol, score (0.0-1.0), and signal (BUY/WATCH/SELL)
    """
    # TODO: Replace with real ML model trained on historical data
    score = round(random.uniform(0.5, 0.95), 2)
    
    if score > 0.8:
        signal = "BUY"
    elif score > 0.6:
        signal = "WATCH"
    else:
        signal = "SELL"
    
    return {
        "symbol": symbol,
        "score": score,
        "signal": signal,
        "confidence": f"{int(score * 100)}%"
    }
