python3 - <<EOF
import os
import shutil
import sys

input_dir = sys.argv[1]
output_dir = sys.argv[2]

for root, dirs, files in os.walk(input_dir):
    for file in files:
        file_path = os.path.join(root, file)

        shutil.copy(file_path, output_dir)
EOF
