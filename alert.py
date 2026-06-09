import logging
from datetime import datetime
from typing import Dict

logger = logging.getLogger(__name__)

def send_alert(data: Dict) -> None:
    """
    Send alert when trading signal meets threshold.
    
    Args:
        data: Dictionary with symbol, score, and signal
    """
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    if data['score'] > 0.8:
        message = f"[{timestamp}] 🚀 BUY SIGNAL - {data['symbol']} | Score: {data['score']} | Confidence: {data.get('confidence', 'N/A')}"
        print(message)
        logger.info(message)
    elif data['score'] < 0.5:
        message = f"[{timestamp}] ⚠️  SELL SIGNAL - {data['symbol']} | Score: {data['score']} | Confidence: {data.get('confidence', 'N/A')}"
        print(message)
        logger.warning(message)
