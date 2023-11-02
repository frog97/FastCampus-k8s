# SSH 관리를 위한 Key 생성
```
ssh-keygen -q -t rsa -N '' -m PEM -t rsa -b 4096 -C test -f ./id_rsa <<<y >/dev/null 2>&1
```
생성후 OS별 SSH를 Agent에 등록 방법 (등록이 되어야 항상 SSH로 Git 접근이 가능)
- Linux
```
eval `ssh-agent`
ssh-add id_rsa
```
## total
```
ssh-keygen -q -t rsa -N '' -m PEM -t rsa -b 4096 -C test -f ./id_rsa <<<y >/dev/null 2>&1
eval `ssh-agent`
ssh-add id_rsa
```

# Github Repository 생성 및 설정
Service Github Repository 참조 방식 (ArgoCD > application.yaml)
```
git@github.com:<사용자 Org명>/service-repository.git
```
Management Github Repo 참조 방식 (Kustomize > Kustomization.yaml)
```
https://github.com/<사용자 Org명>/management-repository/ /argo-cd?ref=main
```
Platform Github Repository 참조 방식 (Terraform > iac.yaml)
```
git@github.com:<사용자 Org명>/platform-repository.git/ /aws/ap-northeast-2/terraform-backend?ref=main

```
## total
```
git@github.com:<사용자 Org명>/service-repository.git
https://github.com/<사용자 Org명>/management-repository/ /argo-cd?ref=main
git@github.com:<사용자 Org명>/platform-repository.git/ /aws/ap-northeast-2/terraform-backend?ref=main
```

# GitOps를 통한 Terraform으로 AWS 인프라/플랫폼 프로비저닝
terraform 초기화 명령어 (Init)
```
terraform init
```
terraform 코드 문법 확인 및 실행 검증(Dry-Run)
```
terraform plan
```
terraform 프로비저닝 수행 및 리소스 생성 (Run)
```
terraform apply
```
## total
```
terraform init
terraform plan
terraform apply
```
10
02.
Github
Repository
생성 및 설정