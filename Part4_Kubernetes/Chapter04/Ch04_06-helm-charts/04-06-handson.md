# 
# minikube 
```
minikube start
```

# 리눅스에서 설치
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh 
./get_helm.sh
```

## repo 
```
helm repo add stable https://charts.helm.sh/stable
helm repo add test-repo https://charts.bitnami.com/bitnami
helm search repo nginx
helm repo update
```
##  application install
```
helm install nginx test-repo/nginx --version 15.3.0
helm upgrade nginx test-repo/nginx --version 15.4.0
helm history nginx
```

## Application rollback
```
helm rollback nginx 1
helm history nginx
REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
1               Tue Oct 31 08:26:35 2023        superseded      nginx-15.3.0    1.25.2          Install complete
2               Tue Oct 31 08:27:06 2023        superseded      nginx-15.4.0    1.25.3          Upgrade complete
3               Tue Oct 31 08:28:51 2023        deployed        nginx-15.3.0    1.25.2          Rollback to 1   
```

##  헬름 파일 가져오기
```
helm fetch --untar test-repo/nginx  --version 15.3.0      
```

```
helm uninstall nginx
helm ls
```


# custom helm chart 만들기 
value.yaml 에 있는 내용들이 templates/deplyment.yaml이나 service.yaml등에 들어간다.
templates/tests/test-connection.yaml응 테스트용 파일..
