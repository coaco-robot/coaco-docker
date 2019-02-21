# coaco-docker
A ready-to-run Docker image for the COACO project

## Usage
The Docker image is automatically build on DockerHub: https://hub.docker.com/r/dylanvanassche/coaco-docker
1. Clone this repo: `git clone https://github.com/coaco-robot/coaco-docker`
2. Add execution permissions: `chmod +x launch.sh`
3. Enjoy! `./launch.sh`

## Build instructions
If you want to change the Dockerfile and test if it works, you can follow the following steps:
1. Enter the repo: `cd coaco-docker`.
2. Run Docker build: `docker build -t coaco-docker .`
3. In order to use your local image, modify the `launch.sh` file: `IMAGE=coaco-docker`
4. Add execution permissions: `chmod +x launch.sh`
5. Enjoy! `./launch.sh`
