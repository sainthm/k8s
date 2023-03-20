# k8s command

## kubectl

<br>

### kubectl get nodes -o wide

- 위 명령어는 Kubernetes 클러스터 내의 모든 노드들의 정보를 조회하는 kubectl 명령어입니다. 각 노드의 상태와 메타데이터 정보를 출력합니다.

- **kubectl**: Kubernetes 클러스터를 관리하기 위한 명령어 인터페이스 (CLI)입니다.
- **get**: Kubernetes 객체들의 정보를 가져오는 명령어입니다.
- **nodes**: 조회할 Kubernetes 노드의 종류를 지정합니다.
- **-o wide**: 출력 형식을 지정하는 옵션 중 하나입니다. -o wide를 지정하면 각 노드의 IP 주소, 상태, 버전, CPU 및 메모리 등의 세부 정보를 포함한 넓은 형식으로 출력됩니다. 이 외에도 -o json, -o yaml, -o name 등 다양한 출력 형식이 제공됩니다.

<br>

### kubectl config view

- API ㅅ서버 통신에 필요한 인증 정보 확인!
- ${HOME}/.kube/config 파일에 대한 정보 확인 명령어