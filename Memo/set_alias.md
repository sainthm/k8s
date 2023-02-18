# set_alias.md

- kubectl 명령어 사용과 관련하여 alias 설정

<br>

## Process

### 1. Symbolic link

```bash
which kubectl

ln -s /usr/bin/kubectl /usr/local/bin/k

ls -al /usr/local/bin
```

<br>

### 2. alias

```bash
# Temporary
alias k=kubectl
```

<br>

```bash
# bashrc setting for long time
vi ~/.bashrc

alias k=kubectl # 해당 내용 추가

source ~/.bashrc
```