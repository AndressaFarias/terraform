# HCL
    É um yaml/yml melhorado/modificado.

## Blocos

É qualquer bloco de código.
 Compreendido por chaves.

[tipo][subtipo][nome]{...}
_exemplo:_
    resource "aws_instance" "example"{...}

## Argumento

- Tudo que está dentro de um bloco;
- É constituido por chave e valor;
- Geralmente a chave é preexistente e está associada ao tipo e subtipo do bloco.

## Identificadores

- É o nome (do bloco, do tipo de bloco, ...)
- O primeiro caracter de um identificador **NÃO** pode ser uma digito;

# Comentário

" # "   - Comentário de linha inteira 
" // "  - Comentário de linha inteira
/* e */ - Cometário de multiplas linhas


