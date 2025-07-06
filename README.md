# 🐶 Project API - Testes automatizados da Dog CEO API

Este projeto automatiza testes de integração para os endpoints da [Dog CEO API](https://dog.ceo/dog-api/), validando comportamento, estrutura, imagens e performance da API.

---

## 🚀 Funcionalidades testadas

- ✅ Listar todas as raças de cachorros (`/breeds/list/all`)
- ✅ Buscar imagens por raça (`/breed/{raça}/images`)
- ✅ Obter imagem aleatória (`/breeds/image/random`)

---

## 🧪 Tecnologias utilizadas

- [Ruby](https://www.ruby-lang.org/)
- [Cucumber](https://cucumber.io/) + [RSpec](https://rspec.info/)
- [Excon](https://github.com/excon/excon) – cliente HTTP
- [RuboCop](https://rubocop.org/) – análise estática
- YAML – dados estáticos organizados por ambiente

---

## 📁 Estrutura do projeto
project-api/
├── features/ # arquivos Gherkin (.feature)
│ ├── step_definitions/ # passos dos testes
│ └── support/ # hooks e helpers globais
├── lib/
│ └── factory/ # Factory::Static e Dynamic
├── static/ # dados de teste estático em YAML
│ └── dev.yml
├── .rubocop.yml # estilo de código Ruby
├── cucumber.yml # configuração de execução
└── README.md

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






