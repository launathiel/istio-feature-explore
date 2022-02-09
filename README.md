# Explore istio Feature
## Traffic Splitting

multiple client version ( v1.0, v2.0, v3.0 )

---

## Apply Client Apps
### apply version 1
```bash
kubectl apply -f /manifest/canary/client-deploy-v1.yaml
```
### apply version 2
```bash
kubectl apply -f /manifest/canary/client-deploy-v1.yaml
```
### apply version 3
```bash
kubectl apply -f /manifest/canary/client-deploy-v1.yaml
```
---

## Apply Gateway
```bash
kubectl apply -f /manifest/gateway/gateway.yaml
```
you must specify the hosts and credentialName

---
## Apply Destination Rule
```bash
kubectl apply -f /manifest/destination-rule/destination-rule.yaml
```
---

## Apply Virtual Service
```bash
kubectl apply -f /manifest/virtual-service/virtual-service.yaml
```