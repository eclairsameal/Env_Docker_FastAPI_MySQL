# Use Python 3.9 as the base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install MySQL client and SQLite
RUN apt-get update && \
    apt-get install -y default-mysql-client sqlite3 && \
    apt-get clean

# Install FastAPI and related dependencies
RUN pip install fastapi uvicorn

# Copy the project code into the container
COPY . .

# Expose FastAPI default port
EXPOSE 8000

# Start FastAPI service
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
