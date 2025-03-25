IStio is using for 

1. Traffic Routing 
2. Which service can communicate 
3. Traffic Spliting 
4. Rerryes 

Istio configuration 
service discovery 
certificate management 
gather telemetry data 

kind: VirtualService 
How to route your traffic to a given destination 
kind: DestinationRules 
Configure what happens to traffic FOR that destination 

IStio Ingress Gateway 

Cluster Request --> Ingress Gateway --> Envoy proxy 

kind: Gateway 

Request --> Istio Gateway --> Virtual Service Rules --> Web server micro service (Envoy Proxy)


# Installing istio 
1. Install istio core and istiod in kubernetes 
2. istio addons for monitoring, Tracing & Visualization 
3. Configure automatic Envoy proxy injection 
4. Deploy an example microservices application 

# minikube start --cpus 3 --memory 4000 
(change the capacify of the minikube )

* Installing istioctl command 

https://github.com/istio/istio/releases 

^^ istioctl downlaod 

# istioctl install 

This will install the Istio 1.25.0 profile "default" into the cluster. Proceed? (y/N) y
✔ Istio core installed ⛵️
✔ Istiod installed 🧠
✔ Ingress gateways installed 🛬
✔ Installation complete

# kubectl get ns 
istio-system      Active   9m11s
# kubectl get pods -n istio-system 
# istiogateway and istio ingress pods are created 
istio-ingressgateway-87cffc5d7-c7kh8   1/1     Running   0          8m56s
istiod-69d4df85cd-84tgq                1/1     Running   0          9m43s

GitHub: https://github.com/GoogleCloudPlatform/microservices-demo 
--> in repo -->release folder --> kubernetes-manifests.yaml --> run #kubectl apply -f kubernetes-manifests.yaml

# kubectl.exe get ns default --show-labels
istio-ingressgateway-87cffc5d7-c7kh8   1/1     Running   0          8m56s
istiod-69d4df85cd-84tgq                1/1     Running   0          9m43s

# kubectl label namespace default istio-injection=enabled 
^^ enabled lable to the default namespace 
--> container istio proxy container is automtically run 

# gather telemetry data 

# istio integrations 
https://istio.io/latest/docs/ops/integrations/

C:\Users\mujee\Downloads\istio-1.25.0-rc.1-win-amd64\istio-1.25.0-rc.1\samples\addons
^^ alredy addons are present in the dowunled page 

# kubectl apply -f addons/

kiali --> data visualization 

# kubectl port-forward svc/kiali -n istio-system 20001

http://127.0.0.1:20001/ 

# istioctl dashboard kiali 

^^ to access the kiali 

^^ we can access kiali in this URL 

https://imesh.ai/blog/what-is-istio/
https://github.com/imesh-ai/webinar 
youtube channel : imesh , Cloud - Deep Tech 

--------------------------------------------------------
Istio: 

--> is a service mesh 
--> extra layer of the software micro services architectute 
--> communication with pods in the kuberntes there is no any restrictions they can talk to any pod in the clster 
--> network call to the pods 
--> layer of the software 
--> traffic  management and security 
--> proxy container is sit in the every pod 

container --> proxy --> istiod --> proxy --> container 

1.5 version before there are many pods in the istio-system namespace they cloub all the pods into one that is istiod pod. 
istiod --> deamon 
kiali UI --> visualization 
tacing 

1. Install Dockerdisktop 
2. Installing minikube 
3. Installing kubectl 
4. Installing istio 

# we can enable kubernetes in the docker cluster to enable in the docker disktop 

# minikube start --driver=virtualbox --no-vtx-check --memory 4096

# minikube delete 

# kubectl port-forward svc/fleetman-webapp 30080:80

127.0.0.1:30080 --> accessing the webapp

Github repo: https://github.com/DickChesterwood/istio-fleetman

# istioctl  --> this is the command 

# kubectl apply -f .\1-istio-init.yaml 








