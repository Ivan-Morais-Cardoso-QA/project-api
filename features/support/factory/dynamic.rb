# frozen_string_literal: true

# Módulo de fábricas utilizadas em testes automatizados
module Factory
  # Classe responsável por fornecer dados dinâmicos para testes automatizados
  class Dynamic
    # Função responsável por validar se o link da imagem está acessível e com tipo correto (jpeg ou png)
    def self.validacao_link_imagem(link_imagem)
      response_imagem = Excon.get(link_imagem)
      status_valido = response_imagem.status == Factory::Static.static_data('response')['sucess']['code']
      content_type_valido = response_imagem.headers['Content-Type'].match?(%r{^image/(jpeg|png)$})

      status_valido && content_type_valido
    end
  end
end
