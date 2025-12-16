# Start from a standard Python image
FROM python:3.13-slim

# Install the necessary system library (libsqlite3-dev)
# This package contains the C headers needed to build the _sqlite3 module.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirement file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the command to run the application (the deployment command)
CMD ["python3", "main.py"]
