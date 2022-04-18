# checkmate-service

Docker compose and build scripts for checkmate app and services

## Steps to set up and run a local copy of CheckMate on Docker

Requirements: Docker

- Run the file [build_checkmate_docker](build_checkmate_docker.sh)
- Edit the generated .env file
  - Set the CHECKMATE_DATA to an appropriate location where checkmate will persist data. Make sure that directory location exists before starting checkmate
