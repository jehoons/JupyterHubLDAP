#!/bin/bash 
source $(dirname $0)/argparse.bash || exit 1

argparse "$@" <<EOF || exit 1
parser.add_argument('exec_mode', type=str, 
    help='build|start|stop|shell|update'
    )
parser.add_argument('-d', '--daemon', 
    action='store_true',
    help='run with foreground mode? [default %(default)s]', 
    default=False
    )
EOF

if [[ $DAEMON ]]; then
    echo " yes, do it"
    DAEMON_MODE=-d
fi

IP_ADDR=`dig +short myip.opendns.com @resolver1.opendns.com`
IMAGE=jhsong/jupyterhub:latest
ME=$(basename ${HOME})
CONTAINER=jupyterhub-${ME}
DOCKER_HOME=/root
HOST_SCRATCH_DIR=${HOME}/.scratch
DOCKER_SCRATCH_DIR=${DOCKER_HOME}/.scratch
PORT_MAPS="-p 8000:8000 -p 8888:8888 -p 443:443 -P"
OPT_BUILD=". -t ${IMAGE}"
OPT_START="$DAEMON_MODE -it --env-file ./env-file --rm --name ${CONTAINER} ${PORT_MAPS} \
	${VOLUMNE_MAPS} ${IMAGE}"

build(){
    docker build ${OPT_BUILD} 
}

shell(){
    docker exec -it ${CONTAINER} bash
}

start(){
    exec docker run ${OPT_START}
}

stop(){
    docker stop ${CONTAINER}
}

rmc(){
    docker rm ${CONTAINER}
}


case "${EXEC_MODE}" in
    shell)
        shell 
        ;; 
    build)
        build 
        ;;
    start)
        start $DAEMON
        ;;
    stop)
        stop
        ;;
    update)
        build 
        if [ $? -eq 0 ] 
        then  
        wait 
	    stop 
            start $DAEMON
        else 
            echo "build failed"
        fi 
        ;; 
    *)
        echo 
esac

