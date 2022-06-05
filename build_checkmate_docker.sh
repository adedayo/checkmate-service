#!/bin/sh

#clone repositories
docker run -ti --rm  -v $(pwd):/git alpine/git clone https://github.com/adedayo/checkmate.git
docker run -ti --rm  -v $(pwd):/git alpine/git clone https://github.com/adedayo/checkmate-app.git

checkmate_host=$(hostname)

# generate CORS config to include this server's hostname
cat > checkmate/cors_config.yaml <<- EOF
cors_hostname_allowlist:
  - ${checkmate_host}
EOF

# generate apiHost config for the CheckMate app
cat > checkmate-app/src/assets/app_config.json <<- EOF
{
    "apiHost": "${checkmate_host}"
}
EOF

# generate a default .env file
cat > .env <<- EOF
CHECKMATE_DATA=/var/lib/checkmate
CHECKMATE_PLUGINS=/var/lib/checkmate/plugins
CHECKMATE_PORT=80
CHECKMATE_APP_SERVERNAME=${checkmate_host}
CHECKMATE_API_PORT=17283
BUILD_LOCATION=$(pwd)
EOF

# Docker compose
# if command -v docker-compose &> /dev/null
# then
#     dcomp='docker-compose'
# else
#     dcomp='docker compose'
# fi

# cp ../docker-compose.yml ../.env  ../.dockerignore .

# ls
# dcomp="nerdctl compose"
# ${dcomp} build 
# ${dcomp} up
# popd
