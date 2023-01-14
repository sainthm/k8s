# Troubleshooting Folder:

<br>

## IAM AssumeRole:

- 해결 완료

- 원인:
    - Main AWS Account의 User policy 중, MFA 강제 정책 할당

## kOps 배포

kops create cluster --zones=ap-northeast-2a,ap-northeast-2c --networking amazonvpc --cloud aws --master-size t3.medium --node-size t3.medium --node-count=2 --network-cidr 172.30.0.0/16 --ssh-public-key ~/.ssh/id_rsa.pub --name=$KOPS_CLUSTER_NAME --kubernetes-version "1.24.9" --dry-run -o yaml > mykops.yaml
