# Robot-Examples

Lembre-se de estar na pasta raiz do projeto para continuar os passos abaixo

[1 passo: instalar o python no linux](docs/Install-python.md)

[2 passo: Configurar o python](docs/Settings-python.md)

[3 passo: Instalar dependências](docs/Install-dependencies.md)

[4 passo: Configuração de IDE](docs/Settins-ide.md)

[Appium](docs/appium.md) (Opcional)

## Executar testes

Executar todos os testes definindo o path da pasta

```
robot tests/ui-test/
```

Execução de testes por tags e paralelo informado -i "flag" -i "flag2" (pode ter mais de um -i "flag")

```
robot -i login -i slow  tests/ui-test/register_ui.robot
```

Execução de testes em ordem de arquivos

```
robot -d results tests/ui-test/register_ui.robot tests/ui-test/login_ui.robot
```

## Executar testes alterando parâmetros de variáveis

```
robot -d ./results -v BROWSER:chromium -v IS_HEADLESS:True tests
```

## Salvar log em outra pasta (opcional) (por padrão é results)

Especificar com -d "pasta"

```
robot -d results tests/ui-test/register_ui.robot
```

## Extras (opcional)

### Sobre o Robot Framework

[Documentação do Robot Framework](https://docs.robotframework.org/docs)

### Instalar dependências caso ocorra algum erro com o pip, usar a flag --break-system-packages

```
pip install "package" --break-system-packages
```

### Criar um novo projeto usando o Robot Framework Language Server

Ctrl + Shift + P e Selecionar

```
Robo Framework: Start Interactive Console
```

### Interagir com Console do Interactive Console

Exemplo

Open Browser e selecione RPA.Browser.Playwright

Para abrir a URL

```
Open Browser    url=https://robotsparebinindustries.com/
```

Existem outros comandos , além disso você pode utilizar o comando abaixo para fazer um recordes dos seletores da página aberta

```
Record Selector
```

### O que é TDD

[Leia sobre o assunto aqui](docs/tdd.md)

### O que é CI/CD

[Leia sobre o assunto aqui](docs/ci-cd.md)
