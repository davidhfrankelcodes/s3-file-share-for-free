# Use the official Python 3.10 image
FROM python:3.10-slim-buster

# Prevent Python from writing .pyc files to disk
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# (Optional) Install system packages needed by your app
# RUN apt-get update && apt-get install -y <packages> && rm -rf /var/lib/apt/lists/*

# Copy only requirements first (for faster caching)
COPY requirements.txt /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the container
COPY . /app

# Expose the port on which your Flask app runs
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
