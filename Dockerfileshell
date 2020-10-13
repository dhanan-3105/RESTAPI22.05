# Shell Script Implementation for Dockerfile
from ubuntu
label maintainer support-apps@oracle.com
copy Sample.sh /code/Sample.sh
copy testfile /code/testfile
run chmod +x /code/Sample.sh
env version=2
entrypoint ["sh","/code/Sample.sh"]
cmd ["/code/testfile"]
