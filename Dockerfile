# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container at /app
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Define environment variable for PORT
ENV PORT=8080

# Command to run the application when the container starts
CMD ["python", "app.py"]
