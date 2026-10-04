# Use an official Python slim runtime as a parent image
FROM python:3.11

# Set environment variables to optimize Python execution inside Docker

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache layers
COPY ./requirements.txt /app/requirements.txt

# Install dependencies without caching the index to reduce image size
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application code
COPY . .


# Command to run the application using the FastAPI CLI
CMD ["fastapi", "run", "app.py","--host","0.0.0.0", "--port", "7680"]
