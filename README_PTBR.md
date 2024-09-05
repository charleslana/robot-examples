### Extensões para instalar no VSCode

```
Robocorp Code
```

```
Robot Framework Language Server
```

### Configuração

No .bashrc, colocar no final da linha este comando

```
export PATH=$PATH:/$HOME/.local/bin
```

### Instalação

Verificar se o python está instalado

```
python3 --version
```

Instalar o pip

```
sudo apt install python3-pip
```

Instalar o Robot Framework

```
pip install robotframework --break-system-packages
```

Instalar o Navegador do Robot Framework

```
pip install robotframework-browser --break-system-packages
```

### Abrir Console do Robot Framework

Adicionar no settings do vscode ambiente

```
"robot.libraries.blacklist": ["RPA.Browser", "RPA.Browser.Selenium"]
```

Ctrl + Shift + P e Selecionar

```
Robo Framework: Start Interactive Console
```

Executar os comandos

Open Browser e selecione RPA.Browser.Playwright

Para abrir a URL

```
Open Browser    url=https://robotsparebinindustries.com/
```

Criar env

```
python3 -m venv venv
```

Ativar env

```
source venv/bin/activate
```
