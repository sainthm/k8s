# k9s

- 명령어 기반 쿠버네티스 관리 도구
- 자원 사용량뿐만 아니라 전체 파드 수량 등 클러스터의 전반적인 현황을 빠르게 파악 가능
- 로컬 kubectl 명령어 실행 결과를 텍스트 기반으로 좀 더 시각적으로 보기 좋게 편집하여 사용자에게 제공

<br>

## 설치

```bash
wget https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz

tar xvfz k9s_Linux_x86_64.tar.gz

sudo mv k9s /usr/local/bin/k9s
```

<br>

## 실행

```bash
k9s info

```