### Extensões para instalar no VSCode

São extensões para o VScode

```
Robocorp Code
```

```
Robot Framework Language Server
```

### Configuração do settings.json do vscode localizado na pasta .vscode/settings.json

Adicionar no settings do vscode ambiente

```
"robot.libraries.blacklist": ["RPA.Browser", "RPA.Browser.Selenium"]
```

Configurar dados do robot (opcional)

```
  "launch": {
    "configurations": [
      {
        "type": "robotframework-lsp",
        "name": "Robot Framework: Launch Template",
        "request": "launch",
        "terminal": "integrated",
        "args": ["--argumentfile", "arguments.txt"]
      }
    ]
  }
```

[Voltar para o README principal](../README.md)
