# k8s component

- 아래의 답변은 모두 ChatGPT를 통해 얻은 답변입니다.

<br>

## Index.

- 네임스페이스
- 서비스
- 디플로이먼트
- 레이블
- 셀렉터

<br>

# 네임스페이스

- 네임스페이스(Namespace): 네임스페이스는 쿠버네티스 클러스터 안에서 논리적인 분리를 제공하기 위한 기능으로, 클러스터 안의 리소스를 그룹화하고 격리할 수 있게 합니다. 
- 각 네임스페이스 안에서는 리소스 이름이 중복될 수 없습니다.

### 네임스페이스 종류(예시)

- Default: 클러스터에 생성된 모든 네임스페이스의 기본 값입니다.
- kube-system: 쿠버네티스 시스템 컴포넌트를 위한 네임스페이스입니다.
- kube-public: 클러스터 내에서 모든 사용자가 읽을 수 있는 공개적인 리소스를 위한 네임스페이스입니다.
- kube-node-lease: 노드 리소스 임대 정보를 저장하는 네임스페이스입니다.
- Custom: 사용자가 직접 생성하는 사용자 정의 네임스페이스입니다.

# 서비스

- 서비스(Service): 서비스는 클러스터 안에서 실행 중인 애플리케이션을 외부에서 접근할 수 있도록 만들어주는 추상화된 리소스입니다. 
- 서비스는 로드밸런싱과 같은 기능을 제공하여 클러스터 안에서 실행 중인 파드에 접근할 수 있도록 합니다.



## 서비스의 종류

- 쿠버네티스(Kubernetes)에서는 다양한 종류의 서비스(Service)를 제공하여 컨테이너 애플리케이션의 노출과 연결을 관리할 수 있습니다. 
- 쿠버네티스에서 제공하는 서비스의 종류와 각각의 특징에 대해 알아보도록 하겠습니다.

ClusterIP
기본적인 서비스 유형으로, 쿠버네티스 클러스터 내부에서만 사용 가능
쿠버네티스 내부 DNS 이름을 통해 애플리케이션에 접근할 수 있음
클러스터 내부에서만 사용되므로 외부에서는 접근이 불가능
NodePort
클러스터 외부에서도 접근 가능한 서비스 유형
모든 노드의 IP 주소와 지정된 포트를 사용하여 서비스를 노출
기본적으로 30000~32767의 포트 범위를 사용하며, 지정된 포트가 사용 중이라면 다른 포트를 자동으로 할당
LoadBalancer
클라우드 제공자에서 제공하는 로드 밸런서를 사용하여 애플리케이션을 외부에 노출하는 서비스 유형
로드 밸런서의 구성과 관리는 클라우드 제공자에 의해 수행
외부 IP 주소를 할당하여 애플리케이션에 접근 가능
ExternalName
외부 서비스의 DNS 이름을 쿠버네티스 내부 DNS에 등록하여, 클러스터 내부에서 외부 서비스를 사용할 수 있게 하는 서비스 유형
서비스의 IP 주소나 포트를 관리하지 않고, 외부 서비스의 DNS 이름만을 가지고 애플리케이션에 노출
외부 서비스에 접근하기 위해 클러스터 외부 DNS 서버를 구성해야 함
Headless
DNS 레코드를 생성하지 않는 서비스 유형으로, 애플리케이션에 직접적으로 접근하는 방식을 사용할 때 유용
서비스에 연결된 파드의 IP 주소를 직접 사용하여 애플리케이션에 접근 가능
주로 StatefulSet과 함께 사용되며, 파드의 유일한 이름을 가지고 직접적인 통신이 필요한 경우에 사용
ExternalTrafficPolicy
서비스 유형 중 하나가 아니라, 기존의 서비스 유형과 함께 사용되는 설정 옵션
Node


# 디플로이먼트

- 디플로이먼트(Deployment): 디플로이먼트는 쿠버네티스에서 애플리케이션 배포를 관리하는 리소스입니다. 
- 디플로이먼트는 파드를 생성하고 업데이트하며, 롤링 업데이트 및 롤백과 같은 배포 전략을 제공합니다.

# 레이블

- 레이블(Label): 레이블은 쿠버네티스에서 리소스를 식별하기 위한 메타데이터입니다. 레이블은 키/값 쌍으로 구성되며, 리소스에 적용할 수 있습니다. 레이블은 셀렉터와 함께 사용하여 특정 레이블을 가진 리소스를 선택할 수 있습니다.

# 셀렉터

- 셀렉터(Selector): 셀렉터는 쿠버네티스에서 리소스를 선택하는 데 사용되는 쿼리입니다. 셀렉터는 레이블을 기반으로 리소스를 선택하며, 일치하는 레이블을 가진 리소스를 선택할 수 있습니다. 셀렉터는 서비스와 함께 사용하여 특정 파드를 선택할 수 있습니다.



# 프로브

- Kubernetes(K8s)에서는 Pod 안에 있는 컨테이너의 상태를 모니터링하기 위해 Liveness Probe와 Readiness Probe를 사용합니다. 이들 Probe는 컨테이너가 실행 중인지, 정상적으로 동작하고 있는지를 확인하여, K8s 시스템에서 이상이 발생하면 해당 컨테이너를 다시 시작하거나 서비스 제공을 제한할 수 있습니다.

### Liveness Probe

- Liveness Probe는 컨테이너가 살아있는지 여부를 확인합니다. 이 Probe는 컨테이너가 정상적인 작동을 유지하고 있는지를 주기적으로 체크하며, 만약 컨테이너가 정상 작동을 하지 않을 경우 K8s 시스템은 해당 컨테이너를 종료하고 다시 시작합니다.
즉, Liveness Probe는 컨테이너가 정상적으로 동작하고 있는지 여부를 체크하여, 컨테이너가 비정상적인 상태에 빠졌을 때, K8s 시스템이 해당 컨테이너를 재시작하여 안정적인 서비스를 유지합니다.

<br>

### Readiness Probe

- Readiness Probe는 컨테이너가 준비되어 요청을 처리할 수 있는 상태인지를 확인합니다. 이 Probe는 컨테이너가 서비스 제공을 시작하기 전에 정상적인 작동을 확인하며, 만약 컨테이너가 아직 준비되지 않은 상태라면 K8s 시스템은 해당 컨테이너에 대한 요청을 거부합니다.
- 즉, Readiness Probe는 컨테이너가 정상적인 작동을 하지만, 서비스 제공을 시작하기 전에 요청을 처리할 준비가 되었는지 여부를 체크합니다. 이는 새로운 컨테이너가 추가될 때 서비스의 안정성을 유지하는 데 매우 중요합니다.

<br>

- 이러한 Probe는 각 컨테이너에 대해 개별적으로 정의될 수 있으며, 다양한 방법으로 설정될 수 있습니다. HTTP 요청, TCP 소켓 검사, 명령 실행 등 다양한 방식으로 설정 가능하며, Probe를 설정함으로써 K8s 시스템은 안정적인 서비스를 유지할 수 있습니다.