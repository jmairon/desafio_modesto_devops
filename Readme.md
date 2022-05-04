## JEAN MAIRON MODESTO - DESAFIO DEVOPS ## 
- O desafio foi feito com as liguagens HCL - Terraform
- A plataforma utilizada foi a Microsoft Azure
- Utilizando Docker container para hospedagem da aplicação e menor custo
- Python && Flask && Ubuntu
- Docker hub - hospedagem de imagem docker

## Passos seguidos para configuração do Docker utilizado no teste:
1 - Realizado um Docker Pull Image - UBUNTU
2 - Realizado a instalação de Python e suas dependencias
3 - Instalação de ambientes virtuais do Python
4 - Instalacao de nginx 
5 - Download do projeto enviado

## Projeto teste no Provider Azure e utilizado Terraform para automatização basica.
a baixo estarei adicionando os comandos utilizados para compilar o projeto
e necessário ter o terraform instalado na máquina ou criar uma maquina
virtual e instalar o terraform.
- Projeto terraform: https://learn.hashicorp.com/
- Demonstra onde pode ser usado o terraform: https://learn.hashicorp.com/terraform
- Tutorial de utilização da ferramenta da AZURE: https://learn.hashicorp.com/collections/terraform/azure-get-started
- Formas de instalação do terraform: https://www.terraform.io/downloads
-- Nesta pagina pode escolher qual ambiente ira utilizar - Linux - Windows - Mac
- Provider's principais - AWS - AZURE - GCP

## Iniciando Instalações && Melhorias.

 Automação da infra, provisionamento dos hosts (IaaS)
-- MICROSOFT AZURE

 Automação de setup e configuração dos hosts (IaC)
-- Terraform

 Pipeline de deploy automatizado
-- Podemos utilizar a Azure Devops como Melhorias

 Monitoramento dos serviços e métricas da aplicação
-- Podemos utilizar as metricas da propria Azure
-- Como melhorias podemos instalar Grafana / Kibana - dependendo da aplicação

 Use ferramentas e bibliotecas open source, mas documente as decisões e porquês;
-- Nesse caso a escolha foi utilizar o terraform para instalação do projeto e automatização
para que nao necessite mais de repetir ou criar o mesmo codigo para qualquer outro teste.
Já possuimos um projeto pronto para reutilizar a instalação até de outras docker.

## Automatize o máximo possível;
-- Para melhoria da automatização podemos melhorar na criação do Dockerfile
-- Push das imagens geradas
-- login automaticos no Provider escolhido.
-- Diminuição de interação com o Painel do Provider escolhido aumentando a segurança

## Distribuição do Projeto
App -> Projeto enviado para o teste
Azure -> Projeto criado com Terraform, que realiza toda a entrada e criação do ambiente
        dentro do Provider.

## Como executar o projeto

## Realizar o clone do Projeto
Dentro do diretório apos instalação do terraform iniciaremos as instalações
Faz se necessário ter uma conta no Portal da Azure.
Caso não tenha precisaremos adequar o codigo para outros Provider "AWS - GCP"

## Dentro do Pasta do Projeto vamos inciar as instalações
# Realizar o login na Provider Azure

$ Entrar no diretório /Azure
$ az login 

# Item a baixo para iniciar o projeto
$ terraform init

# Item para correção e validação do codigo
$ terraform fmt
$ terraform validate

# Item para planejar o que será criado, você terá uma amostra do que será executado.
$ terraform plan -var-file=vars/dev.tfvars

# Item para implatação do Projeto 
$ terraform apply -var-file=vars/dev.tfvars

Aguadar o projeto finalizar.

## A url criada será está: modestotecdev.azurewebsites.net

## TESTE A EXECUTADOS

# matéria 1
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'

# matéria 2
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a good thing","content_id":2}'
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"charlie@example.com","comment":"Indeed, dear Bob, I believe so as well","content_id":2}'
curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"eve@example.com","comment":"Nah, you both are wrong","content_id":2}'

# listagem matéria 1
curl -sv modestotec.azurewebsites.net/api/comment/list/1

# listagem matéria 2
curl -sv modestotec.azurewebsites.net/api/comment/list/2
```

## Caso ocorra problemas nos teste como o a baixo mencionado, fineza reinicia o WEBAPP que foi criado.
e um erro gerado pela própria Azure

# Exemplo de erro a baixo.

curl -sv modestotec.azurewebsites.net/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
*   Trying 191.235.228.35:80...
* TCP_NODELAY set
* Connected to modestotec.azurewebsites.net (191.235.228.35) port 80 (#0)
> POST /api/comment/new HTTP/1.1
> Host: modestotec.azurewebsites.net
> User-Agent: curl/7.68.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 68
> 
* upload completely sent off: 68 out of 68 bytes


* Mark bundle as not supporting multiuse
< HTTP/1.1 503 Service Temporarily Unavailable
< Content-Length: 384
< Server: nginx
< Date: Tue, 03 May 2022 21:06:17 GMT
< 
<div style="display: block; margin: auto;  width: 600px; height: 500px; text-align: center; font-family: 'Courier', cursive, sans-serif;"><h1 style="color: 747474">:( Application Error</h1><p style="color:#666">If you are the application administrator, you can access the <a style="color: grey"href="https://modestotec.scm.azurewebsites.net/detectors">diagnostic resources</a>.</div>
* Connection #0 to host modestotec.azurewebsites.net left intact


## Execução local.
Caso tenha a intenção de executar local segue os passos:

Entrar na pasta ./app nesta pasta está o Dockerfile para que seja
realizado o build da imagem.
comando: 
$ docker build -t modesto/desafio_devops:1.0 .
para executar a imagen criada.
$ docker image ls -> verificar se a imagen foi compilada
$ docker build -t jmairon/desafio_devops .
$ docker run --name mairon01 -p 80:8080 jmairon/desafio_devops:1.2
O terminal irá mostrar o seguinte painel:

$ docker run --name mairon01 -p 80:8080 jmairon/desafio_devops:1.2
[2022-05-04 00:33:50 +0000] [7] [INFO] Starting gunicorn 20.0.4
[2022-05-04 00:33:50 +0000] [7] [INFO] Listening at: http://0.0.0.0:8000 (7)
[2022-05-04 00:33:50 +0000] [7] [INFO] Using worker: threads
[2022-05-04 00:33:50 +0000] [10] [INFO] Booting worker with pid: 10
[2022-05-04 00:33:50 +0000] [11] [INFO] Booting worker with pid: 11

# Agora já pode realizar o testes.
