FROM python:3-slim
COPY action.py /app
COPY requirements.txt /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "./action.py"]
