FROM python:slim-buster

WORKDIR /app

# RUN apk add apt

RUN apt update && apt upgrade -y && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# RUN useradd -u 1001 newspie
# USER newspie

EXPOSE 5000

# HEALTHCHECK CMD curl --fail http://localhost:5000 || exit 1

ENV FLASK_APP=news.py
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
