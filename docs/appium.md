# Appium

Install

```
sudo apt install adb
```

List devices

```
adb devices
```

Run

```
robot -d results --loglevel TRACE tests/mobile-test/app_register.robot
```

Skip mobile tag test

```
robot -d results --loglevel TRACE --skip mobile  tests
```

[Voltar para o README principal](../README.md)
