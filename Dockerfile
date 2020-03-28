FROM python:3.7 AS builder

ENV LANG=C.UTF-8 \
    PIP_NO_CACHE_DIR=false \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN pip install poetry --no-cache

WORKDIR /src

# Install dependencies
COPY ./poetry.* ./
COPY ./pyproject.toml .

RUN poetry install --no-dev


#####################
## Production image #
#####################
FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Copy build artifacts
COPY --from=builder /src /src
ENV PATH=/src/.venv/bin:$PATH

# Add source code
WORKDIR /src
COPY hello hello

CMD ["gunicorn", "--bind=0.0.0.0:5000", "hello:create_app()"]
