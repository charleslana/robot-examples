Execução de test por tags e paralelo

```
robot -i login -i slow  test/ui-test/test.robot
```

Salvar logs em pasta especifica com -d results

```
robot -i login -d results test/ui-test/test.robot
```

Executar todos os testes definindo o path da pasta

```
robot -d results test/ui-test/
```
