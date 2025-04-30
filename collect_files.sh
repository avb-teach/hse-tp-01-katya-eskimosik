if [ "$#" -ne 2 ]; then
    echo "Использование: $0 /path/to/input_dir /path/to/output_dir"
    exit 1
fi

input_dir="$1"
output_dir="$2"

if [ ! -d "$input_dir" ]; then
    echo "Ошибка: Входная директория '$input_dir' не существует."
    exit 1
fi

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
        shutil.copy(file_path, output_dir)
EOF
