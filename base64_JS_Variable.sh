#!/bin/bash


# Configure the premissions by running 'chmod +x base64_JS_Variable.sh' in your terminal.
# Pass the files you want to convert as the arguments.
# To convert test.png:            ./base64_JS_Variable.sh test.png
# For all files in the directory: ./base64_JS_Variable.sh *


# Outline of the Shell Script
# 1. For loop that iterates through each argument
# 2. Create a JS variable with the file's name
# 3. Insert the file's properties
# 4. Insert the Base64 result
# 5. Outputs to a JS file "Base64_Output.js"


echo "$# number of files has been detected."

for file in "$@"
do
  TEMP="${file/%.*}"
  echo "let ${TEMP//-/_}_base64 = '"$(echo "data:")$(file --mime-type -b "$file")";base64,"$(base64 -i "$file")"';" >> Base64_Output_TEST.js
  # echo "let ${file%.*}_base64 = '"$(echo "data:")$(file --mime-type -b "$file")";base64,"$(base64 -i "$file")"';" >> Base64_Output.js
  echo "" >> Base64_Output_TEST.js
done
echo "The encoding is done."
echo "The base64 strings are stored as variables in the \"Base64_Output.js\" file."

# Shout Out to @kylewlacy for his Base64.sh that I used as a reference.
# https://gist.github.com/kylewlacy/2820377
