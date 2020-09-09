FROM frolvlad/alpine-python2
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add --no-cache gcc musl-dev libmemcached-dev postgresql-dev python2-dev zlib-dev
RUN pip install --upgrade pip

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
