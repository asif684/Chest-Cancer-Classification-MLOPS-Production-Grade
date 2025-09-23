FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install OS dependencies
RUN apt-get update -y && apt-get install -y awscli unzip jq && apt-get clean

# Copy requirements first (for better caching)
COPY requirements.txt .

# Upgrade pip and fix setuptools issue
RUN pip install --upgrade pip
RUN pip install setuptools==65.5.0
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port for your API / app
EXPOSE 8080

# Run your app
CMD ["python", "app.py"]
