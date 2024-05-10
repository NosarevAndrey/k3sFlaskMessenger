#!/bin/bash

APP_SECRET=app-secret.yaml
APP_CONFIG_MAP=app-config-map.yaml
POSTGRES_VOLUME=postgres-pv.yaml
POSTGRES_VOLUME_CLAIM=postgres-pvc.yaml
POSTGRES_MANIFEST_SCRIPT=postgres-deploy.yaml
POSTGRES_SERVICE_CONFIG=postgres-service.yaml
FLASK_APP_MANIFEST_SCRIPT=flask-app-deploy.yaml
FLASK_APP_SERVICE_CONFIG=flask-app-service.yaml


declare -a arr=($APP_SECRET
                $APP_CONFIG_MAP
                $POSTGRES_VOLUME
                $POSTGRES_VOLUME_CLAIM
                $POSTGRES_MANIFEST_SCRIPT
                $POSTGRES_SERVICE_CONFIG
                $FLASK_APP_MANIFEST_SCRIPT
                $FLASK_APP_SERVICE_CONFIG)

check_file_exists() {
    if [ ! -f $1 ]; then
        printf "File not found: %s", $1
        exit 1
    fi   
}

apply_services() {
    for i in "${arr[@]}"
    do 
        check_file_exists $i
        kubectl apply -f $i
    done
}

delete_services() {
    for i in "${arr[@]}"
    do 
        check_file_exists $i
        kubectl delete -f $i 
    done
}

parse_arguments() {
    case "$1" in
        -r | --run )
            apply_services
            ;;
        -d | --delete )
            delete_services
            ;;
    esac
    shift
}

parse_arguments "$@"