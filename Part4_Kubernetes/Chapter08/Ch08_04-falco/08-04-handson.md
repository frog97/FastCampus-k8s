terraform apply -auto-approve
aws eks update-kubeconfig --region ap-northeast-2 --name testhh-eks-cluster


terraform destroy -auto-approve

# 3. IAM Policy 및 Role 적용 (CloudWatch 로그 연동용) #1
## (1) Falco 로그 대상 CloudWatch 연동용 IAM Policy 적용 명령어
- Chapter08 > Ch08_04-falco > aws
```
aws iam create-policy --policy-name EKS-CloudWatchLogs --policy-document file://aws/iam_role_policy.json
```

# 3. IAM Policy 및 Role 적용 (CloudWatch 로그 연동용) #2
## (2) Falco 로그 대상 CloudWatch 연동용 IAM Role 적용 명령어

$ aws iam attach-role-policy --role-name <EKS Worker Node Role명>
--policy-arn `aws iam list-policies | jq -r '.[][] | select(.PolicyName ==
"EKS-CloudWatchLogs") | .Arn'`
--> Management Console에서 확인 가능함.
```
aws iam attach-role-policy --role-name testhh-iam-role-eks-nodegroup --policy-arn `aws iam list-policies | jq -r '.[][] | select(.PolicyName == "EKS-CloudWatchLogs") | .Arn'`
```

# 4.
## (1) values.yaml 변경 내역
- Chapter08 > Ch08_04-falco > helm-chart > values.yaml
- jsonOutput: false -> true
## (2) Falco Helm Chart 설치 명령어
- Chapter08 > Ch08_04-falco > helm-chart
$ helm install falco ./
```
cd helm-chart
helm install falco ./
```

helm pull falcosecurity/falco --untar



# Error - trouble shooting
```
> cd helm-chart
> helm install falco ./
Error: INSTALLATION FAILED: Kubernetes cluster unreachable: exec plugin: invalid apiVersion "client.authentication.k8s.io/v1alpha1"
```
# helm 새버전 설치
https://peterica.tistory.com/205 <- 출처

```
helm version
version.BuildInfo{Version:"v3.13.1", GitCommit:"3547a4b5bf5edb5478ce352e18858d8a552a4110", GitTreeState:"clean", GoVersion:"go1.20.8"}
> curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2
```


```
> helm install falco ./
NAME: falco
LAST DEPLOYED: Fri Dec 15 08:14:04 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Falco agents are spinning up on each node in your cluster. After a few
seconds, they are going to start monitoring your containers looking for
security issues.


No further action should be required.


Tip: 
You can easily forward Falco events to Slack, Kafka, AWS Lambda and more with falcosidekick. 
Full list of outputs: https://github.com/falcosecurity/charts/tree/master/falcosidekick.
You can enable its deployment with `--set falcosidekick.enabled=true` or in your values.yaml. 
See: https://github.com/falcosecurity/charts/blob/master/falcosidekick/values.yaml for configuration values.
```
이번엔 kubectl error , 1.23으로 다운 그레이드
```
> kubectl version --client
Client Version: v1.28.4
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
> chmod +x kubectl
> which kubectl
/snap/bin/kubectl
> sudo snap remove kubectl
[sudo] password for frog: 
snap "kubectl" services 정지                                                                                                         
kubectl removed
> which kubectl
kubectl not found
> sudo mv ./kubectl /usr/local/bin/
> 
> 
> which kubectl
/usr/local/bin/kubectl
```