### Defina a versão instalada como padrão (global ou local):

- Para definir globalmente (em todo o sistema):

  ```bash
  pyenv global 3.10.12

  ```

- Para definir localmente (apenas no diretório atual, ou seja vá na pasta do projeto e defina):

  ```bash
  pyenv local 3.10.12

  ```

### Verifique a versão instalada

Depois de instalar e configurar a versão, você pode verificar se a versão correta está sendo usada:

```bash
python --version

```

Isso deve retornar `Python 3.10.12`.

### Configurar o ambiente para a pasta do projeto rodar o comando abaixo, necessário para reconhecer o python no projeto e conseguir rodar as dependências

Criar env

```
python3 -m venv venv
```

Ativar env

```
source venv/bin/activate
```

[Voltar para o README principal](../README.md)
