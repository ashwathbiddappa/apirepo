FROM python:latest
MAINTAINER ashwath
RUN pip install flask
WORKDIR /app
COPY random.sh /app/random.sh
COPY script.sh /app/script.sh
COPY app.py /app/app.py
RUN chmod +x /app/script.sh && chmod +x /app/random.sh
EXPOSE 8080
CMD ["python", "app.py"]

