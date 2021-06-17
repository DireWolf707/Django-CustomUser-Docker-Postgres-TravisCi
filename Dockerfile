FROM python:3.8.10-alpine3.13
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
#postgres dependencies for alpine
RUN apk add --update --no-cache postgresql-client
#storing in temp folder
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev

RUN pip install -r requirements.txt
#deleting temp folder
RUN apk del .tmp-build-deps
COPY . .
RUN adduser -D user
USER user   
