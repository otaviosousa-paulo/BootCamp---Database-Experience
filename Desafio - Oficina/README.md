## 

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

## Desafio de Projeto

- Mapeamento do esquema ER para Relacional
- Definição do script SQL para criação do esquema de banco de dados
- Persistência de Dados para teste
- Recuperação das informações com queries
