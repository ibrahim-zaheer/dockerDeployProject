# # Dockerfile

# # The first instruction is what image we want to base our container on
# # We Use an official Python runtime as a parent image
# FROM python:3.10

# # Allows docker to cache installed dependencies between builds
# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Mounts the application code to the image
# COPY . code
# WORKDIR /code

# EXPOSE 8006

# # runs the production server
# ENTRYPOINT ["python", "manage.py"]
# CMD ["runserver", "0.0.0.0:8006"]
# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.10

# Set environment variables for Django
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE dockerDeployProject.settings
ENV DEBUG 0

# Allows docker to cache installed dependencies between builds
COPY requirements.txt /code/
WORKDIR /code
RUN pip install --no-cache-dir -r requirements.txt

# Mounts the application code to the image
COPY . /code/

# Expose the port where Django runs
EXPOSE 8006

# runs the production server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8006"]
