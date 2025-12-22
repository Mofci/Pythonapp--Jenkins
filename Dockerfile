
FROM python:3.10-slim


WORKDIR /app


COPY . .
RUN pip install --no-cache-dir flask pytest


EXPOSE 5000


CMD ["python3", "hello.py"]

