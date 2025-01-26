1. Criar bucket AWS;

2. Criar usuário programatico AWS;

3. Instalar o Docker;

4. Executar o Terraform no docker;
docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh 

5. Dentro do container exportar as credenciais: 
    ~~~sh
    export AWS_ACCESS_KEY_ID=<Access key ID>
    export AWS_SECRET_ACCESS_KEY=<Secret access key>
    ~~~

6. Executar o comando `terraform init` - cria a pasta .terraform
    Pasta <tf_project_a1_v1>

# tf_project_a1_v2
[//]: # (Mudando de backend remoto para local)
7. No arquivo `main.tf` excluir/comentar o bloco terraform;
    1. Executar o comando `terraform init`
    2. Execute as alterações necessárias.
    3. Executar o comando `terraform plan`

8. Recolocar o bloco terraform
    1. Executar o comando:
        ```sh
            terraform init -upgrade
        ```

9. Executar o comando: 
    `terraform plan -out NomeDoPlano`
  

10. <tf_project_a1_v3>
- Adicionado o arquivo de output.tf;
- `terraform init`
- `terraform plan -out NomeDoPlano`
- `terraform apply`
- será possivel o o IP da instancia que foi criada.
- o bloco outoput no fim do terraform plan, retorna o IP da instancia.

11. <tf_project_a1_v3b>
Outra forma de utilizar o ouput juntamente com o parametro count

12. <tf_project_a1_v4>
- adicionado o bloco `data`no arquivo **ec2.tf**;
- muda a declaração da ami de hardcode para usar referencia;
- `terraform init -upgrade`;
- `terraform plan -out plano`;
- como há diferença entre a ami original que a máquina foi criada e a ami que é obtida por referencia, a máquina é indicado que a máquina deve ser destruida e criada novamente.
- `terraform apply plano`;
- `terraform console`;
    - `data.aws_ami.ubuntu` : retorna todo o map de informações desse recursos;
    - `data.aws_ami.ubuntu.id` : retorna o id da ami que eu desejo

13. <tf_project_a1_v5>
- uso de alias e version
- duplicar os blocos:
    - *provider "aws"* e add o alias
    - *resource "aws_instance" "web"* e alterar o reference name, para que não ocorra conflito;
    - *data "aws_ami" "ubuntu"*
- > terraform plan -out plano
- > terraform apply plano

14. <tf_project_a1_v6>
- Adicionado o arquivo variables.tf
- `terraform init -upgrade`;
- `terraform plan -out plano`;
- `terraform apply plano`;
- rodar novamente passando a variavel por linha de comando
- `terraform plan -var image_id="xxx" -out plano`
- Criado arquivo arquivo .tfvars
- `terraform plan -var-file="variables.tfvars" -out plano`
- Criar um arquivo .auto.tfvars

# AULA 2
1. <tf_project_a2_v1> 
- Criar pasta `servers`;
- add na pasta os arquivos ec2.tf, output.tf e variables.tf;
- criar o arquivo terrafile.tf e add o bloco module -- [Bloco Modulo](https://www.terraform.io/docs/language/modules/syntax.html)
- add a variavel _servers_ no arquivo variables.tf, sem informar valor default.
Porém a variavel apenas foi definida, não está sendo usada, vamos então configurar no arquivo ec2.tf o uso dessa variavel. 
- No bloco `"aws_instance" "web`, vamos adicionar um count referenciando a variavel.
- terraform init --upgrade //para inicilaira o modulos
- terraform plan -out plano
- terraform apply plano
Como o output está dentro do bloco filho, precisamos manipular o output do modulo filho, para acessar o output do modulo filho e usamos a sintaxe `module.<NomeDoModulo>.<NomeDoOutputDoModuloFilho> =ex: module.servers.ip_address
- add o ouput no arquivo terrafile.tf
- o output cadastrado será retornado em nossa console

2. <>
- Criar/configurar o arquivo **dynamodb.tf**
- terraform init
- terraform plan -target=module.mymodule. aws_instance.myinstance
exemplo: terraform plan -out plano -target=resource.aws_dynamodb_table.dynamodb-tf-state-lock
- é preciso informar no bloco backend qual o nome da tabela do dynamo que está sendo usada - main.tf
- para aplicar o `destroy` em recurso que usem o locking é indicado que ao executar o comendo seja informado `-lock=false`

3. 