import streamlit as st
import requests
import time
from datetime import datetime

st.set_page_config(page_title="V10 Trading Dashboard", layout="wide")
st.title("🚀 V10 Trading Profit System")

API_URL = "http://127.0.0.1:8000"

# Sidebar configuration
st.sidebar.header("Settings")
api_status = st.sidebar.empty()
last_update = st.sidebar.empty()

# Check API health
try:
    response = requests.get(f"{API_URL}/health", timeout=2)
    if response.status_code == 200:
        api_status.success("✅ API Connected")
    else:
        api_status.error("❌ API Error")
except Exception as e:
    api_status.error(f"❌ API Offline: {str(e)}")

# Main content
col1, col2 = st.columns(2)

with col1:
    symbol = st.text_input("Stock Symbol", "FPT", placeholder="Enter ticker (e.g., FPT, VNM)")

with col2:
    analyze_button = st.button("🔍 Analyze", use_container_width=True)

# Analysis results
if analyze_button:
    if not symbol:
        st.error("Please enter a stock symbol")
    else:
        try:
            with st.spinner(f"Analyzing {symbol.upper()}..."):
                response = requests.get(f"{API_URL}/analyze/{symbol}", timeout=5)
                
                if response.status_code == 200:
                    data = response.json()
                    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                    
                    # Display results with color-coded signals
                    st.success("✅ Analysis Complete")
                    
                    col1, col2, col3, col4 = st.columns(4)
                    with col1:
                        st.metric("Symbol", data['symbol'])
                    with col2:
                        st.metric("Score", f"{data['score']:.2f}/1.0")
                    with col3:
                        st.metric("Confidence", data.get('confidence', 'N/A'))
                    with col4:
                        signal = data['signal']
                        if signal == "BUY":
                            st.metric("Signal", f"🚀 {signal}")
                        elif signal == "SELL":
                            st.metric("Signal", f"⚠️ {signal}")
                        else:
                            st.metric("Signal", f"👁️ {signal}")
                    
                    # Raw data display
                    st.json(data)
                    st.caption(f"Last updated: {timestamp}")
                    
                else:
                    st.error(f"API Error: {response.status_code} - {response.text}")
        except requests.exceptions.ConnectionError:
            st.error("⚠️ Cannot connect to API. Make sure it's running on http://127.0.0.1:8000")
        except requests.exceptions.Timeout:
            st.error("⏱️ API request timeout")
        except Exception as e:
            st.error(f"Error: {str(e)}")

# History section
st.markdown("---")
st.subheader("📊 How It Works")
st.markdown("""
- **Enter** a stock ticker symbol (Vietnamese stocks: FPT, VNM, etc.)
- **Click Analyze** to get trading signals
- **Score** ranges from 0.0 to 1.0 (higher = stronger signal)
- **Signals**: 🚀 BUY (>0.8) | 👁️ WATCH (0.6-0.8) | ⚠️ SELL (<0.6)

**Note:** Current system uses demo signals. Deploy real ML model for production.
""")
