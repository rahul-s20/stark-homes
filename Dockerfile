FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip3 --no-cache-dir install --upgrade pip
# RUN apk add --update --no-cache postgresql-client jpeg-dev
# RUN apk add --update --no-cache --virtual .tmp-build-deps \ 
#     gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip3 install --no-cache-dir -r requirements.txt
# RUN apk del .tmp-build-deps
RUN mkdir -p /home/app

COPY . /home/app

WORKDIR /home/app
# Environment Variables

# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]