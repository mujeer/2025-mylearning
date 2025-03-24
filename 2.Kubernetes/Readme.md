# pods in the kubernetes is epharmal and they are duy and start 
# to resolve the issue impletemted service because service is constant 
service has 
1. stable Ip addres 
2. loadbalancing 
3. loose coupling 
4. with in and outside the cluster 

service --> pod 
1. cluster IP type 
2. Node port 
3. loadbalancer

IP address of the pod deside the Node Ip address, if the Node IP address start from the 10.2.2.x then the pod ip also start with same IP range 
Node IP: 10.2.2.4
Pod IP: 10.2.2.10

#kubectl get nodes -o wide 
#kubectl get pods -o wide 


Ingress (In the backend configuration we need to give the service name and port numer ) -->  Service ( selector filed need to give the deployment lable name) --> deployment.yaml lable 

* Service has IP address and por number this is need to update in the ingress 
* target port in the service this is the port of the pod 
* kubernetes created the endpoints for accessing below command need to use 

#kubectl get endpoints 

* service port is not specific but the target port should be specific because that is pod port 

# we have mongodb service that is backend service that is also talking to mongodb service endpoint 
# if the mongodb has 2 pods one is mongodb pod and other is metrics pod we have to create one service one access the mongo and metrics 
#multi port service 
#multi container pod 

headless service: 
1. statefull application 
2. master and worker pods 
3. if we add other worker pod then it will update the data into the pod 
clusterIP: None 
--> IP address not going to create in that service because it is none 

#kubectl get service 
1. Service name  --> name of the service in service.yaml
2. type   --> Cluster IP, Nodeport, loadbalancer and Headless service
3. Cluster Ip address -> for headleass service service is not going to create 
4. External IP address  -> only loadbalancer service it is going to create 

#kubectl port-forward svc/nginx-service 8080:80


#kubectl.exe get svc  
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes       ClusterIP   10.96.0.1        <none>        443/TCP        2d22h
myapp            ClusterIP   10.107.200.134   <none>        80/TCP         9m21s
myapp-headless   ClusterIP   None             <none>        80/TCP         13s
myapp-nodeport   NodePort    10.100.1.209     <none>        80:32219/TCP   4m59s

Ingress: 

--> Accessing through the NodePort 
https://my-app.com 

Ingress --> Service --> Pod 

- host: myapp.com 

Ingress installation: 
youtube: https://www.youtube.com/watch?v=80Ew_fsV4rM 

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/ 


vim /c/Windows/System32/drivers/etc/hosts
127.0.0.1 hello-world.info 

minikube tunnel 

Access from the browser 

* Single ingress can sent mutiple requests 
* Multiple hosts with path each host represnts subdomains 

--> TLS centificates in the ingress configuration 






