# 배포된 yaml 파일과 추출한 yaml 파일 비교

<br>

## 배포 yaml 작성 내용 (겹치는 것은 Bold)

- apiVersion
- kind
- metadata
  - name
  - namespace
  - labels
    - app
    - production
- spec
  - replicas
  - selector
    - matchLabels
      - k8s-app
  - template
    - metadata
      - labels
        - k