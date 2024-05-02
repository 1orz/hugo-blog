#!/bin/sh
USER=root
HOST=cloudorz.com
DIR=/root/server/data/wwwroot/blog   # the directory where your web site files should go

hugo && rsync -avz --delete public/ ${USER}@${HOST}:${DIR} # this will delete everything on the server that's not in the local public folder 

exit 0