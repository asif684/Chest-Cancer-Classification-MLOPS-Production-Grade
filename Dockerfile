# ✅ Use a newer, supported base image (Bookworm = Debian 12)
FROM python:3.8-slim-bookworm

# ✅ Always run apt-get update + install in one layer to reduce caching issues
RUN apt-get update -y && apt-get install -y --no-install-recommends awscli \
    && rm -rf /var/lib/apt/lists/*

# ✅ Set working directory
WORKDIR /app

# ✅ Copy project files
COPY . /app

# ✅ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# ✅ Command to run your app
CMD ["python3", "app.py"]
