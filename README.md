# hello-node

## Getting Started

### Prerequisites
Required | Description
--|--
[Git](https://git-scm.com/) | We follow the [GitHub Flow](https://guides.github.com/introduction/flow/)
[Node.js](nodejs.org) | v12.18.3 LTS
[Yarn](https://yarnpkg.com/lang/en/) | 1.22.5 or above

<br>

### Install Node, Yarn
The project manages the version of node through `nvm`.

#### NVM(Node Version Manager)
```shell script
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
$ command -v nvm
```

#### Node.js
```shell script
$ nvm install 12.18.3
$ command -v node
```

#### Yarn
```shell script
$ npm install -g yarn
$ command -v yarn
```
In the project root as follows are performed through the `.nvmrc`

```shell script
$ nvm use
...
```

<br>

## Yarn CLIs

### Install project
```bash
$ nvm use
$ yarn install
```

<br>

### Test
```bash
$ yarn test
```
