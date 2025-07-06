# language: pt

@list_all_breeds
Funcionalidade: Endpoint list all breeds
    Como um analista de qualidade de software
    Gostaria de realizar chamadas para o endpoint list all breeds
    Para consumir seus serviços e garantir que o comportamento está conforme o esperado

    Este teste cobre os seguintes critérios de validação:
    - Verifica se a API está online e retorna status HTTP 200
    - Valida se a estrutura do JSON está conforme o contrato esperado
    - Garante que o campo message não está vazio
    - Garante que o endpoint retorna as raças de cães conforme o esperado
    - Confirma que todos os valores de message são arrays
    - Verifica que o tempo de resposta está dentro de um limite aceitável
   

Cenário: Validar resposta do endpoint "list all breeds"
  Quando realizar uma requisição GET para a rota "breeds/list/all"
  Então a resposta deve conter todas as raças cadastradas no formato correto
  E o tempo de resposta deve estar dentro do limite aceitável