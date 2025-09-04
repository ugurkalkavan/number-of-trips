FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

COPY data/output.csv ./data/output.csv

CMD ["python", "main.py"]
