#!/bin/bash

# Path to the executable
EXECUTABLE="./fdf"

# Path to the directory containing the maps
MAPS_DIRECTORY="./maps"

# Iterate through each map file in the directory and run the executable with it
for MAP_FILE in $MAPS_DIRECTORY/*
do
  echo "======================================"
  echo "Running $EXECUTABLE with map $MAP_FILE"
  valgrind --track-fds=all --leak-check=full --track-origins=yes --show-leak-kinds=all -s $EXECUTABLE "$MAP_FILE"
  echo "======================================"
done
