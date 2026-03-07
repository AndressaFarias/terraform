# Terraform

## Funcionamento 
O terraform possui um arquivo de definição (HCL) e um binário do Terraform. O binário - aplicação - lê o arquivo de definição, que é descritivo, e aplica o que foi definido.

O Terraform possui um arquivo de estado em que ele guarda o último estado - configuração - que foi aplicado. 

O Binário usa o arquivo de estado para verificar se houve alguma alteração no arquivo de definição que necessite ser aplicada. 


# Tipos de infraestrutura

## Infra Mutável
Um servidor vai sofrendo alterações para que atenda às necessidades que surgem ao longo do tempo.

* Pode-se ao longo do tempo perder a astreabilidade do quê de fato stá instalado no servido; uma vez que as alterações são feitas a medida que novas "features" são implementas. 
* Então o que pode estar documentado, pode não ser o que de fato está instalado.
* Servidor snowflake 

### Servidor snowflake
- Cada servidor é único;
- Não é possivel reproduzir exatamente o que está criado;
- 


## Infra Imutável
Se é necessário instalar uma nova ferramenta, um novo servidor é criado e efetuado o apontamento de DNS para esse novo servidor que contém a nova ferramenta. Caso haja a necessidade de _rollback_, basta trocar o apontamento para o servidor antigo.


# Cloud

- Abstração de Serviços.


## API

É software que escuta em um determinada porta os comandos que são enviadas e transformam em ações dentro da cloud.
Visa padronizar o modo de criaça, deleçao e alteraçao dos serviços disponibilizados pela Cloud.

![Funcionamento-Terraform](/terraform/DOCS/assets/terraform-001.png)

