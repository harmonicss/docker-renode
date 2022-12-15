################################################################################ 
# eds Dockerfile for renode + pyrenode
#
# use:
#    docker build -t "harmonicss/renode" .
#
#    docker run  -it --rm  -e DISPLAY -v $XAUTHORITY:/home/developer/.Xauthority -v ~/$(pwd):/home/dev --name=renode --net=host harmonicss/renode renode ./renode-config.resc
#
#
#
################################################################################ 


# only v1.12 is in dockerhub, want the latest, so build locally first from https://github.com/renode/renode-docker 
# then use our local 1.13.0 image
FROM renode:1.13.0


RUN apt update
RUN apt install -y git

WORKDIR /home/dev

RUN pip install git+https://github.com/antmicro/pyrenode.git
RUN pip install git+https://github.com/antmicro/renode-run

RUN echo 'alias ll="ls -hal --color"' >> ~/.bashrc

CMD ["renode"]


