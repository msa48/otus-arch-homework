1. Prometheus Stack
Use https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

command:
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring --create-namespace --atomic -f '.\Kubernetes Cluster Setup\kube-prometheus-stack.yaml'

2. Nginx Ingress
Use https://kubernetes.github.io/ingress-nginx/ 

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace --atomic -f 'Kubernetes Cluster Setup\ingress-nginx.yaml'

3. Grafana Dashboards
Nginx Ingress: https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/nginx.json
prometheus-net: ASP.NET Core - controller summary (Prometheus): https://grafana.com/grafana/dashboards/10915
prometheus-net: General: https://grafana.com/grafana/dashboards/10427