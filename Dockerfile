# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.10
FROM python:3.10

# Встановимо змінну середовища
ENV P_SE_HW4 /hw4

# Встановимо робочу директорію всередині контейнера
WORKDIR $P_SE_HW4

# Встановлюємо poetry
COPY pyproject.toml $P_SE_HW4/pyproject.toml
COPY pyproject.toml $P_SE_HW4/pyproject.toml

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 3000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "main.py"]