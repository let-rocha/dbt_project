Este projeto foi desenvolvido com o objetivo de aplicar boas práticas de Analytics Engineering utilizando o dbt (data build tool). O foco principal é transformar dados brutos em tabelas prontas para análise, garantindo qualidade, documentação e linhagem de dados clara.

Dados utilizados: Sources (Dados crus do Olist no BigQuery)

O projeto explora o ciclo de vida da transformação de dados: desde a ingestão da camada Raw até a entrega de métricas de negócio na camada Analytics.

Para organizar o fluxo de dados, estruturei o projeto seguindo o conceito de camadas:
1. Staging

Lugar dos dados brutos (raw)
Casting de tipos de dados
Limpeza inicial e remoção de duplicatas.

2. Intermediate

Joins entre diferentes fontes de dados de staging
Aplicação de regras de negócio

5. Marts

Modelagem dimensional com tabelas fato e dimensão
Dados prontos para consumo por ferramentas de BI

Neste projeto, implementei:
Generic Tests: Garantia de unicidade (unique) e de que campos essenciais não sejam nulos (not_null).
