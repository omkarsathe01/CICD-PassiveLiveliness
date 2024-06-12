FROM python:3.10.9

WORKDIR /app

COPY . .

RUN chmod 777 -R /app

RUN pip install gunicorn

RUN pip install --no-cache-dir -r requirements.txt

RUN apt update \
  && apt -y install build-essential \
  && apt -y install libglib2.0-0 \
  && apt -y install libgl1-mesa-glx \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

EXPOSE 5000

CMD ["sh", "entrypoint.sh"]
