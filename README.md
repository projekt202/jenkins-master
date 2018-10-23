# jenkins-master
Self contained, persistent Jenkins image.

# Quick Start

This will Jenkins up and running with basic jobs and default config.

1. Make sure you have all the pre-reqs installed (Docker for Mac or Docker for Windows)
2. Clone this repository to your local drive
3. Fire up the container
    1. `cd jenkins` 
    2. `make build`
    3. `make run`
4. Point your browser to http://localhost:8080
5. Get the default admin password
    1. run `docker exec -it jenkins-master /bin/bash -c "cat var/jenkins_home/secrets/initialAdminPassword"`
6. Add desired plugins and configure your pipleine.
