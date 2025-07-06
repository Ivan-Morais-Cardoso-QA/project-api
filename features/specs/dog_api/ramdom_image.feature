# language: pt

@ramdom_image
Funcionalidade: Endpoint Random image
    Como um analista de qualidade de software
    Gostaria de realizar chamadas para o endpoint Random image
    Para consumir seus serviços e garantir que o comportamento está conforme o esperado

    Este teste cobre os seguintes critérios de validação:
  - Verifica se a API está online e retorna status HTTP 200
  - Valida se a estrutura do JSON está conforme o contrato esperado
  - Garante que o campo message contém um link de imagem válido
  - Verifica se o campo status possui o valor success
  - Confirma que as imagens retornadas são diferentes em múltiplas chamadas
  - Valida que o tempo de resposta está dentro de um limite aceitável

Cenario: Validar estrutura, tempo de requisição e comportamento do endpoint de imagem aleatória
    Quando realizar uma requisição GET para a rota "breeds/image/random"
    Então a resposta deve conter uma imagem de raça em formato válido e estrutura correta
    E ao fazer múltiplas requisições, as imagens retornadas devem ser diferentes
    E o tempo de resposta deve estar dentro do limite aceitável