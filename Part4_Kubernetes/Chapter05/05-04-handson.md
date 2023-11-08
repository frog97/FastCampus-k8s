
# 사전 진행 사항
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/platform/aws/ap-northeast-2/terraform-codes
terraform apply -auto-approve
aws eks update-kubeconfig --name testhh-eks-cluster
cat ~/.kube/config
kubectl get nodes; kubectl get pods -A
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version


# 1. ArgoCD 설치 및 Web UI 접속 명령어
ArgoCD 구성
ArgoCD 설치 스크립트 경로
- gitops-repository > management > argo-cd > scripts > setup.sh
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/management/argo-cd/scripts
chmod +x setup.sh && ./setup.sh
kubectl get pods -A
kubectl get svc -A
# 여기서 나온 domain name 을 웹브라우저에 치고.. 보안 설정 넘어가고. username에 admin 입력하고 패스워드는 아래 방법으로 확인
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo #패스 워드 확인
```
- 최종 출력되는 난수가 ArgoCD Web UI의 admin 패스워드
Web UI 접속
```
kubectl get svc argocd-server ‒n argocd
```
- LoadBalancer DNS 주소를 웹브라우저에 입력후 접속

# 2. Repository 및 SSH 설정
ArgoCD 구성
Repository 및 SSH 설정 경로
- 좌측 톱니바퀴 > 1번째 탭 Repositories > 상단 1번째 탭 "Connect repo using SSH" 클릭
Connect repo using SSH 입력 정보
- Project : default
- Repository URL : git@github.com:<사용자 Org명>/service-repository.git
- SSH private key data
* SSH 입력시 Github에 등록한 SSH의 Private Key와 동일한 Key(id_rsa)를 입력

```
git@github.com:frog97/FastCampus-k8s.git
```