FROM python:3.6

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip && \
    pip install \
        Flask \
        awscli \
        flake8 \
        pylint \
        pytest \
        pytest-flask \

EXPOSE 8080

ENTRYPOINT [ "python" ]
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
CMD [ "/app/app.py" ]