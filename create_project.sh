#!/bin/bash
mkdir data
echo "I am creating a new project. We should define following things:"
read -p "What is the project? " PROJECT
echo "$PROJECT" > data/PROJECT.md
