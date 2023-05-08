FROM python:3.8-slim-buster
RUN mkdir /pdf && chmod 777 /pdf

WORKDIR /pdf

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

RUN apt update && apt install ocrmypdf
RUN apt install -y wkhtmltopdf

COPY . .

CMD python3 pdf.py
