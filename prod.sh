#!/bin/bash


if [ $mode == 'build' ] 
then
    echo "Building prod image..."
    docker compose build
    
elif [ $mode == 'run' ] 
then
    echo "Starting service..."
    docker compose up

elif [ $mode == 'kill' ] 
then
    echo "Stopping service"
    docker compose down 
fi
