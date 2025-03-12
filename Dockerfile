FROM python:3.10
# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-venv \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*


# Set work directory
WORKDIR /app

# Create and activate virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install basic Python packages
RUN pip install --no-cache-dir \
    django \
    djangorestframework \
    python-dotenv

#Copy content to app folder
COPY . /app

#Expose port
EXPOSE 8000

#Run Django Server
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
# Keep container running
#  CMD ["bash"]


