FROM python:3.11
ENV UVICORN_HOST 0.0.0.0                                     
ENV UVICORN_PORT 8080
WORKDIR /app
COPY . /app
RUN pip3 install .[prod]
EXPOSE 8080
CMD [ -f /app/instance/minstrel.sqlite ] || quart --app minstrel init-db ; uvicorn --factory minstrel:create_app