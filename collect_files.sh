input_dir="$1"
output_dir="$2"

mkdir -p "$output_dir"

python3 - <<EOF
import os
import shutil
import sys

input_dir = sys.argv[1]
output_dir = sys.argv[2]

for root, dirs, files in os.walk(input_dir):
    for file in files:
        file_path = os.path.join(root, file)

        new_file_name = file
        if new_file_name in file_count:
            file_count[new_file_name] += 1
            new_file_name = f"{os.path.splitext(file)[0]}{file_count[new_file_name]}{os.path.splitext(file)[1]}"
        else:
            file_count[new_file_name] = 1
            
        shutil.copy(file_path, output_dir)
EOF
