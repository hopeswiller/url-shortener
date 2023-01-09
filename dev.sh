#!/bin/bash


if [ $mode == 'build' ] 
then
    echo "Building development image..."
    docker compose -f docker-compose.debug.yml build
    
elif [ $mode == 'run' ] 
then
    echo "Starting service..."
    docker compose -f docker-compose.debug.yml up

elif [ $mode == 'kill' ] 
then
    echo "Stopping service"
    docker compose -f docker-compose.debug.yml down 
fi
