# Use official Python runtime as parent image
FROM python:2.7-slim

# Set working directory to /app
WORKDIR /app

# Copy current directory contents into container at /app
COPY . /app

# Install any packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variables
ENV NAME World

# Run ap.py when the container launches
CMD ["python", "app.py"]

