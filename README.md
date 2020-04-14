# prueba-orange

## Ejercicio 1

Este ejercicio no se puede terminar ya que la imagen de Jenkins oficial lleva sin actualizarse 2 años y no permite instalar
los plugins necesarios para el desarrollo del mismo. De todas formas me he dado cuenta tarde y había desarrollado ya el 
Dockerfile y el docker-compose.yml, así que os lo dejo por aquí para que le echéis un vistazo si queréis.


## Ejercicio 2 

El ejercicio lo voy a realizar con GCP.

1) Creamos el cluster, en GCP, las máquinas por defecto son de tipo n1-standard-2, así que no es necesario especificarlo.


gcloud container clusters create prueba-orange-cluster \
    --num-nodes 2 \
    --region us-west1

Asignamos permisos de administrador a nuestro usuario de Google, este será el usuario admin del challenge, Este rol predeterminado del cluster asigna permisos read/write en todo el cluster

kubectl create clusterrolebinding cluster-admin-binding \
      --clusterrole cluster-admin \
      --user juancarmartin1994@gmail.com 

Creamos los 5 usuarios 

kubectl config set-credentials usuario-1 --username=usuario-1 --password=usuario-1
kubectl config set-credentials usuario-2 --username=usuario-2 --password=usuario-2
kubectl config set-credentials usuario-3 --username=usuario-3 --password=usuario-3
kubectl config set-credentials usuario-4 --username=usuario-4 --password=usuario-4
kubectl config set-credentials usuario-5 --username=usuario-5 --password=usuario-5

Creamos los dos namespaces 

kubectl create namespace usuario-1
kubectl create namespace usuario-2

Asiganmos permisos de lectura a usuario-1 y usuario-2 con otro rol predeterminado de Kubernetes

kubectl create clusterrolebinding usuario-1-read-cluster \
	--clusterrole system:aggregate-to-view \
        --user usuario-1

kubectl create clusterrolebinding usuario-2-read-cluster \
        --clusterrole system:aggregate-to-view \
        --user usuario-2

Creamos el rol de edición en el namespace usuario-1 para el usuario-1, y le hacemos el bind


kubectl create rolebinding usuario-1-edit-role --clusterrole=edit --user=usuario-1 --namespace=usuario-1
kubectl create clusterrolebinding usuario-1-edit-namespace \
	--clusterrole 

