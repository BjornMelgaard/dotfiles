# ------------------------------------
# Docker alias and function
# ------------------------------------

# Just docker
alias d="docker"

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $drd base /bin/echo hello
alias drd="docker run -d -P"

# Run interactive container, e.g., $dri base /bin/bash
alias dri="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Kill container
alias dk="docker kill"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drmac() { docker rm $(docker ps -a -q); }

# Remove all images
drmai() { docker rmi $(docker images -q); }

# Stop and Remove all containers
alias drmaci='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# ------------------------------------
# Docker-compose alias and function
# ------------------------------------

# if Dockerfile was changed
alias dc-rebuild="docker-compose build"

# docker-compose exposes ports only on up
alias dcrp="docker-compose run --service-ports"

alias dc="docker-compose"
alias dcu="docker-compose up"

alias dcr-simple="docker-compose run --service-ports --no-deps --rm"
