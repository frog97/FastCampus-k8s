# 사전 진행 사항
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/platform/aws/ap-northeast-2/terraform-codes
terraform apply -auto-approve
aws eks update-kubeconfig --name testhh-eks-cluster
cat ~/.kube/config
kubectl get nodes; kubectl get pods -A
```

# 1. EKS에 Application 배포

EKS에 Application 배포 경로
- service > guestbook에서 다음의 명령어 실행
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/service/guestbook
kubectl get po -A
kubectl apply -f application.yaml

kubectl get application -n argocd
kubectl get all -n argocd
kubectl get svc -A

kubectl scale deploy guestbook-ui --replicas=3 -n guestbook # 이렇게 수동으로 넣어주면 gitOps에 있는 내용대로 다시 1로 변경되어 버림.
#git 에서 변경해야 replica가 3으로 변경됨.
```
Web UI 접속후 확인
- application > guestbook
- guestbook 토폴로지 구성 및 상태 확인
- guestbook service에서 명시된 LoadBalancer 주소로 접속해 웹페이지 출력 확인

# 2. Desired State 검증
1. kubectl로 pod 강제 삭제
```
$ kubectl delete po guestbook-ui-<POD명> -n guestbook
```
2. kubectl로 edit를 통해 pod수 강제 증가
```
$ kubectl edit deploy guestbook-ui -n guestbook
```
- replicas를 1 -> 3으로 증가
* kubectl 처리후 바로 ArgoCD Web UI에서 변경사항 확인 및 Refresh 버튼 클릭

# 3. GitOps 검증
1. Deployment Manifest에서 Replica수 변경
```
$ service-repository > guestbook > guestbook-ui-deployment.yaml
```
- replicas를 1 -> 3으로 증가
2. Service Manifest에서 type변경
```
$ service-repository > guestbook > guestbook-ui-svc.yaml
```
- type을 LoadBalancer -> ClusterIP로 변경
kubectl 처리후 바로 ArgoCD Web UI에서 변경사항 확인 및 Refresh 버튼 클릭

# 사후 진행 사항
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/service/guestbook
kubectl delete -f application.yaml


cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/management/argo-cd/scripts
kubectl kustomize ../manifests/| kubectl delete -n argocd -f -


cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/platform/aws/ap-northeast-2/terraform-codes
terraform destroy -auto-approve
```