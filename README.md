##### Simple Falsk app with Docker

##### What is Falsk
######Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries. It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions.Flask is also easy to get started with as a beginner because there is little boilerplate code for getting a simple app up and running.

######For example, simple application web application with Flask return home page with Welcome To Sample Flask with Docker:

```sh
import random
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
	return render_template("index.html")


if __name__ == "__main__":
	app.run(host='0.0.0.0')
```

####### With few lines of code we are generating Website that much simple it is with falsk.

#### What is Docker
####### Docker is a open-source project that automates the deployment of software applications inside containers by providing an additional layer of abstraction and automation of OS-level virtualization on Linux.

#### Installation Steps:
```sh
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update
$ sudo apt-cache policy docker-ce
$ sudo apt-get install -y docker-ce
$ sudo systemctl status docker
```

Fork the project to your personal account and get a local copy on your machine.
Change into the project folder, please go ahead and clone the repository locally like so -.

```sh
$ https://github.com/balaraju1278/simple-flask-docker.gt
$ cd simple-flask-docker
```

####### The next step now is to create an docker image with this web app.How are we going to do that? The answer is - using a Dockerfile

##### Dockerfile
A Dockerfile is a simple text-file that contains a list of commands that the Docker client calls while creating an image. It's a simple way to automate the image creation process. 
```sh
# base image
FROM python:3-onbuild

# port number that container should expose
EXPOSE 5000

# run the application
CMD ["python", "./app.py"]
```

#######Now that we have our Dockerfile, we can build our image. The docker build command does the heavy-lifting of creating a Docker image from a Dockerfile.
```sh
$ docker build -t bala1278/simple-flask .
```
####### The last step in this section is to run the image and see if it actually works 
```sh
$ docker run -p 8888:5000 bala1278/simple-flask
```
####### (Optional) Here we see how to push our docker image to docker hub
```sh
$ docker login --username yourusername --password yourpassword
```
####### aftoer logging you will see similer message 
```sh
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /home/balu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```
####### docker image command will gives you all the list of images in locally you can have similer 
```sh
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
bala1278/simple-flask   latest              109d1e5c3755        3 minutes ago       700MB

```
####### push local docker image to docker hub
```sh
docker push bala1278/simple-flask
```

####### Thats all
