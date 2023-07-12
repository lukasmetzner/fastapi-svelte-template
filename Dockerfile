FROM node:18.11.0

WORKDIR /app

COPY frontend/ .

RUN npm install

RUN npm run build

FROM python:3.10

WORKDIR /usr/src/app

COPY --from=0 /app/dist ./dist/

RUN pip3 install poetry

COPY backend/poetry.lock .
COPY backend/pyproject.toml .

RUN poetry config virtualenvs.create false 
RUN poetry install --no-interaction --no-ansi

COPY backend/ .

CMD ["poetry", "run", "python3", "run.py"]
