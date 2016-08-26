minhassenhas
==========

[![Build Status](https://travis-ci.org/webgoal/minhassenhas.svg?branch=master)](https://travis-ci.org/webgoal/minhassenhas)
[![Code Climate](https://codeclimate.com/github/webgoal/minhassenhas/badges/gpa.svg)](https://codeclimate.com/github/webgoal/minhassenhas)
[![Test Coverage](https://codeclimate.com/github/webgoal/minhassenhas/badges/coverage.svg)](https://codeclimate.com/github/webgoal/minhassenhas/coverage)

Desenvolvimento
---------------
### Instale:

  - Linux
    - [virtualbox](https://www.virtualbox.org/)
    - [docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
    - [docker-compose](https://docs.docker.com/compose/install/)
    - [docker-machine](https://docs.docker.com/machine/install-machine/)

  - Mac / Windows
    - [docker-toolbox](https://www.docker.com/products/docker-toolbox)

Com o docker-machine, crie uma VM local e aponte seu docker para ela:

```sh
docker-machine create default --driver virtualbox
eval $(docker-machine env default)
```

### Executando a aplicação em desenvolvimento

```sh
  docker-compose up
```

### Instalando novas gems

Adicione a gem necessária no Gemfile e faça o build da imagem novamente

```sh
docker-compose build
docker-compose up
```

### Executando testes
Quaisquer outras tarefas administrativas como:
  - migrations
  - generators
  - console
  - seeds
  - rake

Também podem ser executadas dessa mesma maneira
```sh
docker-compose run web rake spec
```


#### Modo desacoplado (detached)

```sh
docker-compose up -d
```
Visualizando os logs. Caso não informar nenhuma imagem, ele exibirá os logs de todos os containers
```sh
docker-compose [imagem] logs
```

Deploy
------

Para colocar em Produção:

Realizar o build da imagem e mandar para o [hub.docker.com](http://hub.docker.com)
~~~sh
docker-compose build
docker tag minhassenhas_web webgoal/minhassenhas
docker push webgoal/minhassenhas
~~~

Preferencialmente em outra aba...

Fazer nosso docker client apontar para o DOCKER_HOST de produção
```sh
../docker-atelie
export MACHINE_STORAGE_PATH=`pwd`
eval $(docker-machine env docker-atelie)
```

Executar os comandos:

- Atualiza a versão da imagem
```sh
docker-compose -f docker-compose-production.yml pull
```

- Executa as migrations
```sh
docker-compose -f docker-compose-production.yml run web bundle exec rake db:migrate
```

- Compila os assets para produção
```sh
docker-compose -f docker-compose-production.yml run web bundle exec rake assets:precompile
```

Executar a nova versão da aplicação

Caso os containers NÃO estejam em execução
```sh
docker-compose -f docker-compose-production.yml up -d
```

Caso esteja
```sh
docker-compose -f docker-compose-production.yml restart
```
