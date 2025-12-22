# استخدم نسخة Python خفيفة
FROM python:3.12-slim

# تحديد مجلد العمل
WORKDIR /app

# نسخ ملف الـ requirements
COPY requirements.txt .

# تثبيت الـ dependencies
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات
COPY . .

# تحديد متغيرات البيئة للـ Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# أمر التشغيل (استخدم gunicorn للإنتاج)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]

