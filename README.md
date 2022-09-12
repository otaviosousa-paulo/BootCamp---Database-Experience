# BootCamp---Database-Experience
## BootCamp - Database Experience DIO

# BootCamp---Database-Experience
## BootCamp - Database Experience DIO

[Cronograma BootCamp](https://web.dio.me/track/database-experience)

## Bootcamp sobre Banco de Dados, Modelamos um cenário de E-commerce.

## Narrativa - E-comerce
### Produto
- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos(terceiros).
- Cada produto possuiu um fornecedor.
- Um ou mais produtos podem compor um pedido.
### Cliente
- O cliente pode se cadastrar no site com seu CPF ou CNPJ.
- O endereço do cliente irá determinar o valor do frete.
- Um cliente pode comprar mias de um pedido. Este tem um período de carência para devolulção do produto.
### Pedido
- Os pedidos são criados por clinetes e possuem informmações de compra, endereçõ e status da entrega.
- Um produto ou mais compoem o pedido.
- O pedido pode ser cancelado.

# Modelamos um cenário de Oficia

## Narrativa - Oficina ### Levantamento de Requisitos

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina.
- clientes leval veículos à oficina mêcanica para serem consertados ou para passarem por revisões periódicas.
- Cada Veículo é designado a uma equipe de mêcanicos que identifica os serviços a sereme executados e preenche uma OS com data de entrega.
- A partir da OS, calcule-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
- O valor de cada peça também irá compor a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executado os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada Os possui: nº, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
