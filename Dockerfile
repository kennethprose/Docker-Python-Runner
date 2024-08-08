# Use an official Python runtime as a parent image
FROM python:slim-bookworm

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /usr/src/app

# Add a script to clone the repository and run the python file
COPY run.sh /usr/src/app/run.sh
RUN chmod +x /usr/src/app/run.sh

# Define the entrypoint
ENTRYPOINT ["/usr/src/app/run.sh"]