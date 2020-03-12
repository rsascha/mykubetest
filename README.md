# Just a try to deploy a full stack app (powered by nx) to microkube

## Diagram of the Setup

![diagram](./material/k8s.png)

## Setup

### Setup microk8s

To run this project you need:

- https://microk8s.io/docs/

### Setup project

```bash
cd my-fullstack-app
./env.setup.sh
```

## Twitch

https://www.twitch.tv/gp4791

## Development

### IDE

I'm using [Visual Studio Code](https://code.visualstudio.com/download).

### Source Control Management

I'm using git-flow.

Check out:

https://danielkummer.github.io/git-flow-cheatsheet/index.de_DE.html

```bash
apt-get install git-flow
```

### Debugging

I found out that it is very useful to monitor log messages during development:

```bash
journalctl -f | grep microk8s
```
