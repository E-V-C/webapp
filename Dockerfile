# Use an official Python runtime as a base image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /webapp

# Copy the current directory contents into the container at /app
COPY . /webapp

# Install Flask
RUN pip install Flask

# Make port 4000 available to the world outside this container
EXPOSE 6000

# Run app.py when the container launches
CMD ["python", "app.py"]
