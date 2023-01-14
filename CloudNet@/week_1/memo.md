- **워커 노드 증가**(ASG = Auto Scaling Group 활용) - [링크](https://kops.sigs.k8s.io/tutorial/working-with-instancegroups/) [링크2](https://kops.sigs.k8s.io/operations/scaling/)
    
    ```bash
    # 인스턴스그룹 정보 확인
    **kops get ig**
    NAME			ROLE	MACHINETYPE	MIN	MAX	ZONES
    master-ap-northeast-2a	Master	t3.medium	1	1	ap-northeast-2a
    nodes-ap-northeast-2a	Node	t3.medium	1	1	ap-northeast-2a
    nodes-ap-northeast-2c	Node	t3.medium	1	1	ap-northeast-2c
    
    # 편집
    **kops edit ig nodes-ap-northeast-2a**
    spec:
      **maxSize: 3
      minSize: 2**
    
    # 적용
    kops update cluster --yes
    kops rolling-update cluster
    
    # 워커노드 증가 확인
    **kubectl get node**
    ```
    
- **Metrics 파드** 설치 - [링크](https://kops.sigs.k8s.io/addons/#metrics-server)
    
    ```bash
    # kOps 클러스터 편집 : 아래 내용 추가
    kops edit cluster
    -----
    spec:
      **certManager:
        enabled: true**
      **metricsServer:
        enabled: true**
    -----
    
    # 업데이트 적용 : 적용이 안될 경우 한번 더 아래 명령 실행
    kops update cluster --yes && echo && sleep 5 && kops rolling-update cluster
    
    # 파드 확인 : 서비스 정상 상태로 변경까지 대략 2분 30초 정도 소요
    watch kubectl get pod -A
    
    # deploy 2개의 파드를 1개로 줄임
    **kubectl** scale deployment -n kube-system metrics-server --replicas 1
    
    # 확인
    kubectl top node
    kubectl top pod -A
    ```
    
- AWS kOps에 **Node local DNS cache** 설정하기 - [링크](https://kops.sigs.k8s.io/addons/#node-local-dns-cache)
    
    ```bash
    spec:
      kubeDNS:
        provider: CoreDNS
        nodeLocalDNS:
          enabled: true
          memoryRequest: 5Mi
          cpuRequest: 25m
    ```
    
- **Gossip DNS** 로 AWS kOps 배포하기 - [링크](https://kops.sigs.k8s.io/gossip/) [링크2](https://kops.sigs.k8s.io/bastion/#access-when-using-gossip) [링크3](https://kops.sigs.k8s.io/contributing/gossip/)
- AWS kOps **Audit Logging** 설정하기 - [링크](https://kops.sigs.k8s.io/cluster_spec/#audit-logging)
- AWS kOps **Private Cluster** 설정하기 - [링크](https://kops.sigs.k8s.io/topology/) [링크2](https://kops.sigs.k8s.io/operations/high_availability/#example-2-private-topology)
- AWS kOps **Rolling Updates** 실행해보기 - [링크](https://kops.sigs.k8s.io/operations/rolling-update/)
- AWS kOps 인스턴스그룹에 **spot 인스턴스** 사용해보기 - [링크](https://kops.sigs.k8s.io/tutorial/working-with-instancegroups/#converting-an-instance-group-to-use-spot-instances)
- AWS kOps **multiple master** 설정하기 - [링크](https://kops.sigs.k8s.io/operations/high_availability/#example-3-multiple-masters-in-the-same-az) [링크2](https://kops.sigs.k8s.io/single-to-multi-master/)
- AWS kOps에 **Karpenter** 활용하기 - [링크](https://kops.sigs.k8s.io/operations/karpenter/) [링크2](https://kops.sigs.k8s.io/addons/#karpenter)
- AWS kOps의 **ETCD 백업, 복구, 암호화** 해보기 - [링크](https://kops.sigs.k8s.io/operations/etcd_backup_restore_encryption/)
- AWS kOps에 **IRSA** 설정하기 - [링크](https://kops.sigs.k8s.io/cluster_spec/#service-account-issuer-discovery-and-aws-iam-roles-for-service-accounts-irsa)
- **기존에 존재하는 VPC** 에 AWS kOps 클러스터 설치하기 - [링크](https://kops.sigs.k8s.io/run_in_existing_vpc/)
- AWS kOps에 **VPC CNI 의 옵션값**(예. WARM_IP_TARGET) 적용하기 - [링크](https://kops.sigs.k8s.io/networking/aws-vpc/#configuration)