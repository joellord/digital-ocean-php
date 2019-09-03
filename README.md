# Nginx/PHP-FPM deployment on multiple K8s distributions

This repo contains the definition files to deploy an nginx/php-fpm application to various kubernetes distributions.

`/app` contains a basic php application (a simple hello world)
`/definitions` contains the various definitions files depending on the platform you are using.

## Deployment

* Go to the definitions folder
  * `cd definitions`
* Use the deploy script for the desired platform

## Deploy on Digital Ocean

`./deploy.sh digital-ocean`

Then go to your droplets and open up a port for your nginx pod.

## Deploy on Azure

`./deploy.sh azure`

Routes should be exposed by the azure_route.yaml file

## Deploy on OpenShift

`./deploy.sh openshift`

Go to the console and click on "Create Route" to expose nginx
