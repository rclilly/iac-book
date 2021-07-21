#!/bin/bash

example_directories=$(find $(pwd)/ch*/s* -type d -not -path '*/\.*' -not -path '*/_*')

for directory in $example_directories; do
    echo "****** running terraform init in ${directory}... ******"
    cd ${directory} && terraform init
    echo "****** running terraform validate in ${directory}... ******"
    cd ${directory} && terraform validate
    echo "****** running terraform fmt in ${directory}... ******"
    cd ${directory} && terraform fmt

    echo "**** running python... ****"
    cd ${directory} && python main.py
done