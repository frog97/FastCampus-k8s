# 1. EKS에 Application 배포

EKS에 Application 배포 경로
- service > guestbook에서 다음의 명령어 실행
```
$ kubectl apply -f application.yaml
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
405.
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
