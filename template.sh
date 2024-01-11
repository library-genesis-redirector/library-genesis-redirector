#!/bin/bash

# print usage info
usage() {
	echo "Usage: ${BASH_SOURCE[0]} -m MD5"
        exit 1
} ; if [[ "$#" -lt 1 ]]; then usage; fi

# parse options
while getopts ":m:" opt; do
    case "${opt}" in
        m) MD5="${OPTARG}" ;;
        :) echo "Error: -${OPTARG} requires an argument." ; usage ;;
        *) usage ;;
    esac
done

# main
cat > ${MD5}.html <<EOF
<!DOCTYPE html>
<html>
   <head>
      <title>Redirecting, please wait..</title>
      <meta charset="UTF-8" />
      <meta http-equiv="refresh" content="5; URL=https://libgen.is/book/index.php?md5=${MD5}" />
   </head>
   <body>
      <p>Redirecting, please wait.. If you are not redirected within 5 seconds, click <a href="https://libgen.is/book/index.php?md5=${MD5}">here</a> to go to the Library Genesis.</p>
   </body>
</html>
EOF
