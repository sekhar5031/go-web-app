## Checklist for Running on Minikube ##
**Start Minikube:** 
Ensure Minikube is running. You can start it with:
 ```bash
minikube start
```


**Apply Namespace (if used):**
```bash
kubectl apply -f namespace.yaml
```



**Apply ConfigMap and Secret:**


```bash
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
```


**Apply PersistentVolumeClaim:**

```bash
kubectl apply -f pvc.yaml
```


**Apply PostgreSQL Deployment and Service:**

```bash
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml
```


**Apply Go Web Application Deployment and Service:**

```bash
kubectl apply -f go-app-deployment.yaml
kubectl apply -f go-app-service.yaml
```


**Additional Considerations for Minikube**

* Ingress: If you want to expose your Go application to the outside world, you might need to set up an Ingress controller or use NodePort for the service. Minikube has a built-in ingress controller that you can enable with:

```bash
minikube addons enable ingress
```

* Service Type: If you're using a ClusterIP service type and need to access your app from outside Minikube, you may need to use a NodePort service or LoadBalancer (which Minikube simulates) for easier access.

* Port Forwarding: For testing, you can use port forwarding to access your services:

```bash
kubectl port-forward service/go-app-service 8080:8080
kubectl port-forward service/postgres-service 5432:5432
```

* Resource Limits: Ensure Minikube has sufficient resources (CPU and memory) to handle your deployments. You can adjust Minikube's resource allocation with:

```bash
minikube start --memory=4096 --cpus=2
```


* Verification
After applying all configurations, check the status of your pods and services with:

```bash
kubectl get pods -n go-app
kubectl get services -n go-app
```
If everything is set up correctly, your PostgreSQL and Go web application should be running in your Minikube cluster.