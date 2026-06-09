@echo off
echo Starting V10 Trading API...
python -m uvicorn api:app --reload
pause
