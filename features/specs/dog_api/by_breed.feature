# language: pt

@by_breed
Funcionalidade: Endpoint por raça
  Como analista de qualidade de software
  Quero realizar chamadas para o endpoint que retorna imagens por raça
  Para garantir que o serviço está disponível e responde corretamente

  Este conjunto de testes cobre os seguintes critérios:
  - Verifica se a API responde com status HTTP 200
  - Valida se a estrutura do JSON segue o contrato esperado
  - Garante que todas as imagens contenham o nome da raça na URL
  - Verifica se os links das imagens estão acessíveis e com tipo de conteúdo válido
  - Garante que o campo "status" contenha o valor "success"
  - Valida se todos os itens do array "message" são URLs válidas no domínio esperado (images.dog.ceo)
  - Verifica se o tempo de resposta está dentro de um limite aceitável

Cenário: Validar a resposta do endpoint por raça ao buscar pela raça "hound"
  Quando realizar uma requisição GET para a rota "breed/hound/images"
  Então a resposta deve conter todas as imagens da raça "hound" cadastradas no formato correto
  E o tempo de resposta deve estar dentro do limite aceitável

Cenário: Validar o comportamento da API ao buscar por uma raça inexistente
  Quando realizar uma requisição GET para a rota "breed/raca_inexistente/images"
  Então a resposta deve conter uma mensagem de erro pois a raça não existe
