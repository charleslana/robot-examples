# Instalar e Gerenciar versão python

Para instalar a versão Python 3.10.12 no Linux Mint, você pode seguir os seguintes passos:

### 1. Usando `pyenv` para gerenciar versões do Python

O `pyenv` é uma ferramenta útil para gerenciar múltiplas versões do Python em um mesmo sistema. Siga os passos abaixo para instalar o `pyenv` e a versão Python 3.10.12:

### a. Instale as dependências necessárias:

```bash
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

```

### b. Instale o `pyenv`:

```bash
curl https://pyenv.run | bash

```

### c. Adicione o `pyenv` ao seu shell:

```bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

```

Necessário reiniciar a IDE/Terminal para que reconheça o pyenv

### d. Instale a versão Python 3.10.12:

```bash
pyenv install 3.10.12

```

[Voltar para o README principal](../README.md)
