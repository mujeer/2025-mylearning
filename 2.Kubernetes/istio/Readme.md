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

#minikube start --cpus 3 --memory 4000 
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




