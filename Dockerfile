# استخدم Python 3.12 slim
FROM python:3.12-slim

# حدد مجلد العمل
WORKDIR /app

# انسخ ملف requirements
COPY requirements.txt .

# ثبّت الباكيجات
RUN pip install --no-cache-dir -r requirements.txt

# انسخ باقي ملفات المشروع
COPY . .

# خليه يسمع على كل الواجهات
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# افتح البورت
EXPOSE 5000

# أمر تشغيل التطبيق
CMD ["flask", "run"]

