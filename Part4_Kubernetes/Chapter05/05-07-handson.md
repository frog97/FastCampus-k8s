# 5 Kubernetes 배포를 위한 GitHub와 ArgoCD 활용
실습 내용
순서
1. Canary 배포 설정 (Rollout object)
2. Rollout object 배포
3. CLI 및 GUI로 배포 확인
4. Bubble Pool Application 배포 확인 (Stable)
5. Service Repo내 Bubble Pool 코드 업데이트 및 변경 배포 확인 (Canary)
실습 예제코드 경로
Chapter05

# 1. Canary 배포 설정 (Rollout object)
Canary 배포 설정 경로
- service-repository > bubblepool > rollout.yaml 에서 설정
```
kind: Rollout
metadata:
name: bubble-pool
.. 중략 ..
- setWeight: 20
- pause: {duration: 15}
- setWeight: 40
- pause: {duration: 15}
- setWeight: 60
- pause: {duration: 15}
- setWeight: 80
- pause: {duration: 15}
- setWeight: 100
- pause: {duration: 15}
.. 중략 ..
image: argoproj/rollouts-demo:red
```

# 2. Rollout object 배포

EKS에 Rollout object 배포 경로
- gitops-repository > service > bubblepool에서 다음의 명령어 실행
```
$ kubectl apply -f application.yaml
```
ArgoCD Web UI 접속후 배포 상태 확인
- application > bubblepool
- bubblepool 토폴로지 구성 및 상태 확인
- bubblepool service에서 명시된 LoadBalancer 주소로 접속해 GUI 출력 확인

# 3. CLI 및 GUI로 배포 확인

CLI로 배포 확인
```
$ kubectl argo rollouts get rollout bubble-pool ‒watch
```
GUI로 배포 확인
- 웹브라우저 > http://localhost:3100
- 우측 상단 NS: bubblepool

# 4. Bubble Pool Application 배포 확인 (Stable) #1
Bubble Pool App Object 생성 확인
```
$ kubectl get all ‒n bubblepool
```
LoadBalancer 도메인 주소 확인
- service object 확인시 출력되는 External-IP의 도메인 주소로 접속
```
$ kubectl get svc bubble-pool ‒n bubblepool
```
LoadBalancer 도메인 주소로 접속
- 웹브라우저 > http://도메인 주소:80

# 4. Bubble Pool Application 배포 확인 (Stable) #2
Bubble Pool Application 배포 확인 (Stable)
- 전체 Pool내 Red Bubble만 확인

# 5. Service Repo내 Bubble Pool 코드 업데이트 및 변경 배포 확인 (Canary) #1

Bubble Pool 코드 업데이트 경로 (IDE)
- service-repository > bubblepool > rollout.yaml 에서 설정
```
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
name: bubble-pool
.. 중략 ..
containers:
- name: bubble-pool
image: argoproj/rollouts-demo:blue
```
Image Tag를 수정후 commit > push
- red > blue

# 5. Service Repo내 Bubble Pool 코드 업데이트 및 변경 배포 확인 (Canary) #2

Bubble Pool 및 변경 배포 확인 (Canary)
- 전체 Pool내 점진적으로 Red Bubble > Blue Bubble로 전환 확인
