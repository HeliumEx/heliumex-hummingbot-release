# HeliumEx Hummingbot Release

A set of scripts and tools to configure an environment to use the HeliumEx fork of Hummingbot

## Getting Started

### Linux

Run the create script to download and run the app

```
./scripts/create.sh
```

Later, if you exit, you can run the start script to start the app again

```
./scripts/start.sh
```

### Mac

- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)

The steps for Mac are the same as linux

```
./scripts/create.sh
```
```
./scripts/start.sh
```

### Windows

Windows is a bit different.  The best way to run the app is to use the Windows Subsystem for Linux, Version 2

- Install [WSL & update to WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- During WSL2 installation, choose [Ubuntu 20.04 LTS](https://www.microsoft.com/en-us/p/ubuntu-2004-lts/9n6svws3rx71?rtc=1&activetab=pivot:overviewtab)
- Install [Docker Desktop and use the WSL2 Backend](https://docs.docker.com/docker-for-windows/wsl/)

You can now launch `Ubuntu 20.04` like any other app from the Windows Start menu.  Do that.

In the Ubuntu Comand Prompt, navigate to this repository.  somerthing like:

```
cd /mnt/c/Users/<your uwindows user directory>/Downloads/heliumex-hummingbot-release
```

Now, you can run the create and start commands just like on Linux and Mac

```
./scripts/create.sh
```
```
./scripts/start.sh
```

## Configurations


