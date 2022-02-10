# Certificate Using Cert Manager
## Install Cert Manager using Helm
```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.7.1 --set installCRDs=true
```
## Apply Clusterissuer
```bash
kubectl apply -f clusterissuer.yaml
kubectl get clusterissuer
```
## Apply Certificate
```bash
kubectl apply -f certificate.yaml
kubectl get certificate -n istio-system
```
### Check if secret already created
```bash
kubectl get secret -n istio-system
```
you'll see the secret named ```launathiel-domain-cert-prod``` and you can use those secret into istio gateway

```bash
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: app-gateway
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 443 
      name: https
      protocol: HTTPs
    tls: 
      mode: SIMPLE
      credentialName: launathiel-domain-cert-prod # use the secret here
    hosts:
    - "posts.launathiel.com"
```

after that, you can access the site at ```https://posts.launathiel.com``` with TlS connection.