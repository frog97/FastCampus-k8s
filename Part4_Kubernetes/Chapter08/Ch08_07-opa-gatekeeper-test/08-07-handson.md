```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter08/Ch08_00/terraform-codes
terraform apply -auto-approve
aws eks update-kubeconfig --region ap-northeast-2 --name testhh-eks-cluster

```


# 3. OPA Gatekeeper 설치 (Helm Chart)
## (1) Helm Chart를 이용한 OPA Gatekeeper 설치 명령어
- Chapter08 > Ch08_06-opa-gatekeeper
$ helm install ./ --name-template=gatekeeper --namespace
gatekeeper-system --create-namespace
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter08/Ch08_06-opa-gatekeeper
helm install ./ --name-template=gatekeeper --namespace gatekeeper-system --create-namespace
```
ㅜㅜ 에러... 아래걸로 대체
```
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update
helm install --name-template=gatekeeper -n gatekeeper-system gatekeeper/gatekeeper --create-namespace
```
(2) Helm Chart 설치 결과 확인 명령어
$ helm list -n gatekeeper-system
$ kubectl get all -n gatekeeper-system
```
helm list -n gatekeeper-system
kubectl get all -n gatekeeper-system
```

# 1. ConstraintTemplate 및 Constraint 코드 소개 및 배포
## (1) ConstraintTemplate 및 Constraint 코드 경로 및 배포 명령어
- Chapter08 > Ch08_07-opa-gatekeeper-test
$ kubectl apply -f ./
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter08/Ch08_07-opa-gatekeeper-test
kubectl apply -f ./
kubectl apply -f ./
```

# 2. Label 없이 Nginx POD 배포 및 결과 확인
## (1) Label 없이 Nginx POD 배포 명령어
$ kubectl run nginx --image=nginx

```
kubectl run nginx --image=nginx
```

결과 
```
Error from server (Forbidden): admission webhook "validation.gatekeeper.sh" denied the request: [label-check] 

DENIED. 
Reason: Our org policy mandates the following labels: 
You must provide these labels: {"stage", "status", "zone"}
```



# 3. 필요 Label 추가 및 Nginx POD 배포 및 결과 확인
## (1) 필요 Label 추가 및 Nginx POD 배포 명령어
$ kubectl run nginx --image=nginx -l zone=ap-northeast-2,stage=test,status=ready
```
kubectl run nginx --image=nginx -l zone=ap-northeast-2,stage=test,status=ready
```


마무리
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter08/Ch08_00/terraform-codes
terraform destroy -auto-approve
```