# 5 Kubernetes 배포를 위한 GitHub와 ArgoCD 활용

# 실습 내용
순서
1. Argo Rollout 및 플러그인 설치
2. Argo Rollout Dashboard 접속

실습 예제코드 경로
Chapter05

# 1. Argo Rollout 및 플러그인 설치
Argo Rollout 및 플러그인 설치 스크립트 경로
- gitops-repository > management > argo-rollout > scripts > setup.sh
```
$ chmod +x setup.sh && ./setup.sh
```
실행 코드
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/management/argo-rollout/scripts
chmod +x setup.sh && ./setup.sh
```

Argo Rollout Dashboard를 Background로 기동
- http://localhost:3100

# 2. Argo Rollout Dashboard 접속 #1

Argo Rollout Dashboard URL
- http://localhost:3100
접속후 배포된 rollout Object 확인 방법
- 우측 상단에 있는 "NS:" 부분에 명시된 드롭다운 리스트 클릭
- 드롭다운 리스트 중 rollout object가 배포된 NS(Namespace) 선택

# 사후 진행 사항
```
cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/service/guestbook
kubectl delete -f application.yaml


cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/management/argo-cd/scripts
kubectl kustomize ../manifests/| kubectl delete -n argocd -f -


cd /home/frog/workspace/fast-k8s/FastCampus-k8s/Part4_Kubernetes/Chapter05/gitops-repository/platform/aws/ap-northeast-2/terraform-codes
terraform destroy -auto-approve
```