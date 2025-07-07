# 🐶 Project API - Testes automatizados da Dog CEO API

Este projeto automatiza testes de integração para os endpoints da [Dog CEO API](https://dog.ceo/dog-api/), validando comportamento, estrutura, imagens e performance da API.

---

🧪 Executar testes via GitHub Actions
Os testes são executados automaticamente a cada push ou pull request na branch main. Também é possível rodar manualmente e baixar o relatório:

▶️ Executar manualmente
Acesse a aba Actions

Clique em “CI - Testes Automatizados”

No canto superior direito, clique em “Run workflow”

Escolha a branch main e clique novamente em Run workflow

📥 Baixar o relatório de testes
Após a execução, clique no job em execução ou já concluído

Vá até a etapa "Upload artifact"

Clique em cucumber-report.zip

Extraia e abra o arquivo report.html no navegador



## 🚀 Funcionalidades testadas e relatório com última execução

- ✅ Listar todas as raças de cachorros (`/breeds/list/all`) ![image](https://github.com/user-attachments/assets/a125651f-cbc8-49e5-b9f0-2c499101d1fa)

- ✅ Buscar imagens por raça (`/breed/{raça}/images`) ![image](https://github.com/user-attachments/assets/95087899-443c-4cec-9b0b-666b3bb76b03)
  
- ✅ Obter imagem aleatória (`/breeds/image/random`) ![image](https://github.com/user-attachments/assets/d3b87d17-681a-41c4-8897-d2cc33e6489c)


---

## 🧪 Tecnologias utilizadas

- [Ruby](https://www.ruby-lang.org/)
- [Cucumber](https://cucumber.io/) + [RSpec](https://rspec.info/)
- [Excon](https://github.com/excon/excon) – cliente HTTP
- [RuboCop](https://rubocop.org/) – análise estática
- YAML – dados estáticos organizados por ambiente

---

## 🛠️ Pré-requisitos

- Ruby 2.7 ou superior
- Bundler instalado (`gem install bundler`)

---

## 💻 Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/Ivan-Morais-Cardoso-QA/project-api.git
   cd project-api

2. Instale as dependências:
   bundle install

## ▶️ Execução
    bundle exec cucumber # executa todos os testes
    bundle exec cucumber --tags @by_breed # executa os testes por tags

## 🔍 Critérios validados nos testes
    - Status HTTP da API (200 ou erro esperado)
    - Estrutura do JSON (chaves message, status, code)
    - Tipo do conteúdo (Content-Type)
    - URLs de imagem contendo a raça buscada
    - URLs válidas e acessíveis (https, domínio images.dog.ceo)
    - Formatos válidos (.jpg, .jpeg, .png)
    - Aleatoriedade no endpoint /breeds/image/random
    - Tempo de resposta dentro do limite definido
    - Mensagens de erro apropriadas em casos inválidos






