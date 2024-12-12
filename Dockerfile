FROM python:3.13-alpine

WORKDIR /app

COPY ./requirements-dev.txt ./
COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements-dev.txt

# Copy the rest of the application code to the container
COPY ./ ./

# Setup the command to run when the container starts
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]