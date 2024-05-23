FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1  \
    PORT=80

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update \
    && apt-get install -y gcc python3-dev \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

COPY . /app/

EXPOSE $PORT

CMD ["sh", "-c", "uvicorn app:app --host 0.0.0.0 --port $PORT"]