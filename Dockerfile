# Get current python Alpine image.
FROM python:3.7-alpine

# Lable enables setting any metadata you require.
LABEL Maintainer=" Hamza Alwan"

# Tell Python to run in unbuffered mode (recommended),
# doesn't allow Python to buffer outputs instead prints them directly
ENV PYTHONUNBUFFERED 1

# Copy content to Docker container
COPY ./requirements.txt /requirements.txt
# Run the requirement.txt file inside the container 
RUN pip install -r /requirements.txt

# Create the app dirictory inside the Docker container 
RUN mkdir /app
# Assign the default working dirictory
WORKDIR /app
# Copy the app from the local dirictory to the Docker container
COPY ./app /app

## This is done for security reasons, if we don't do this,
## the image will run the application using the root account.
# Create a user that will run the application using Docker
RUN adduser -D user
# Switch to the user
USER user
