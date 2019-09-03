## get the deploy type, defaults to "openshift"
platform=$1;
if [ "$platform" != "" ]; then
    echo "Getting ready to deploy on $platform"
else
    platform="openshift"
    echo "Using default --openshift"
fi

## Delete everything
kubectl delete deployment php
kubectl delete deployment nginx
kubectl delete svc php
kubectl delete svc nginx
kubectl delete pvc code
if [ "$platform" = "openshift" ]; then
    kubectl delete pvc tmp
    kubectl delete configmap php-config
fi
kubectl delete configmap nginx-config


## Deploy services
kubectl apply -f php_service.yaml
kubectl apply -f nginx_service.yaml

## Deploy volume(s)
kubectl apply -f code_volume.yaml
if [ "$platform" = "openshift" ]; then
    kubectl apply -f tmp_volume.yaml
fi

## Config Maps
kubectl apply -f nginx_configMap.yaml
if [ "$platform" = "openshift" ]; then 
    kubectl apply -f php_configMap.yaml
fi

## Create deployments
kubectl apply -f php_deployment.yaml
kubectl apply -f nginx_deployment.yaml

## Check everything
kubectl get services -o wide
