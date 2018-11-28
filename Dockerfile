# base image
FROM python:3-onbuild

# port number that container should expose
EXPOSE 5000

# run the application
CMD ["python", "./app.py"]