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

