#!/bin/bash
# base64_Shell.sh
# 1. Output with the number of agruments
# 2. Create an output file
# 3. Generate the base64 of the file in the argument
# 4. Store the base64 string as variable in the output file
# 5. Repeate till all arguments are done.

echo "$# number of files has been detected."

for file in "$@"
do
  echo "let ${file%.*}_base64 = '"$(echo "data:")$(file --mime-type -b "$file")";base64,"$(base64 -i "$file")"';" >> Base64_Output.js
  echo "" >> Base64_Output.js
done
echo "Conversion is done. The base64 are stored as variables in the file \"Base64_Output.js\"."
