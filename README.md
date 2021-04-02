# hello-node

## Getting Started

### Prerequisites
Required | Description
--|--
[Git](https://git-scm.com/) | We follow the [GitHub Flow](https://guides.github.com/introduction/flow/)
[Node.js](nodejs.org) | v14.15.3 LTS

<br>

### Install Node
The project manages the version of node through `nvm`.

#### NVM(Node Version Manager)
```sh
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
$ command -v nvm
```

In the project root as follows are performed through the `.nvmrc`
```sh
$ nvm use
...
```

#### Node.js
```sh
$ nvm install v14.15.3
$ command -v node
```

### Install project
```sh
$ nvm use
$ npm install
```

<br>

### Test
```sh
$ npm test
```
