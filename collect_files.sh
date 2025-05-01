#!/bin/bash

input_dir="$1"
output_dir="$2"

mkdir -p "$output_dir"

python3 - <<EOT
import os
import shutil

in_dir = os.path.abspath("$input_dir")
out_dir = os.path.abspath("$output_dir")

file_count = {}

for root, dirs, files in os.walk(in_dir):
    for file in files:
    
        file_path = os.path.join(root, file)
        name, per = os.path.splitext(file)

        new_file_name = file

         if new_file_name in file_count:
             file_count[new_file_name] += 1
             new_file_name = f"{name}{file_count[new_file_name]}{per}"
         else:
             file_count[new_file_name] = 1

        shutil.copy(file_path, out_dir)
EOT
