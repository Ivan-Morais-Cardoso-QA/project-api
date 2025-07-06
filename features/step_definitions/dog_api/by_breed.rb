# frozen_string_literal: true

Então('a resposta deve conter todas as imagens da raça {string} cadastradas no formato correto') do |raca|
  aggregate_failures do
    response_esperado       = Factory::Static.static_data('response')
    content_type_esperado   = Factory::Static.static_data('json_informacoes')['content_type']
    imagens                 = @response_json['message']

    # Status e headers
    expect(@response.status).to eq(response_esperado['sucess']['code'])
    expect(@response.headers['Content-Type']).to eq(content_type_esperado)

    # Estrutura do JSON
    expect(@response_json).to include('message', 'status')
    expect(imagens).to be_an(Array)
    expect(imagens).not_to be_empty
    expect(@response_json['status']).to eq(response_esperado['sucess']['message'])

    # URLs das imagens
    imagens.each do |url|
      expect(url).to match(%r{^https://images\.dog\.ceo/.*\.(jpg|jpeg|png)$})
      expect(url).to include(raca)
    end

    # Verifica acessibilidade da primeira imagem
    expect(Factory::Dynamic.validacao_link_imagem(imagens.first)).to be_truthy
  end
end

Então('a resposta deve conter uma mensagem de erro pois a raça não existe') do
  aggregate_failures do
    response_esperado     = Factory::Static.static_data('response')
    content_type_esperado = Factory::Static.static_data('json_informacoes')['content_type']
    erro_esperado         = response_esperado['error']

    # Status e headers
    expect(@response.status).to eq(erro_esperado['code'])
    expect(@response.headers['Content-Type']).to eq(content_type_esperado)

    # Estrutura e conteúdo do JSON
    expect(@response_json).to include('status', 'message', 'code')
    expect(@response_json['status']).to eq(erro_esperado['status'])
    expect(@response_json['message']).to eq(erro_esperado['message'])
    expect(@response_json['code']).to eq(erro_esperado['code'])
  end
end
