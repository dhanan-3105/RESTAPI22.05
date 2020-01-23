# REST API IMPLEMENTATION WITH EXPRESS...
from node:12.14
label maintainer dj@mwa-apps.com
run mkdir /code
add node.js /code/node.js
add data.json /code/data.json
run npm install -y express
run npm install -y body-parser
expose 9000
workdir /code
cmd node /code/node.js
