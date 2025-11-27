FROM python:3.11-slim
WORKDIR /app
COPY app.py /app/
RUN pip install flask
EXPOSE 12024
CMD ["python3", "app.py"]
