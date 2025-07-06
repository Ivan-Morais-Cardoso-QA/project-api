# frozen_string_literal: true

Então('a resposta deve conter uma imagem de raça em formato válido e estrutura correta') do
  aggregate_failures do
    response_esperado     = Factory::Static.static_data('response')
    content_type_esperado = Factory::Static.static_data('json_informacoes')['content_type']
    url_base              = Factory::Static.static_data('urls')['url_base']

    # Valida status, headers e estrutura do JSON
    expect(@response.status).to eq(response_esperado['sucess']['code'])
    expect(@response.headers['Content-Type']).to eq(content_type_esperado)
    expect(@response_json).to be_a(Hash)
    expect(@response_json).to include('message', 'status')

    # Valida tipos e conteúdo dos campos
    expect(@response_json['message']).to be_a(String)
    expect(@response_json['message']).to match(%r{^https://.*\.(jpg|jpeg|png)$})
    expect(@response_json['message']).to start_with(url_base)
    expect(@response_json['status']).to eq(response_esperado['sucess']['message'])

    # Verifica se o link da imagem está acessível e com tipo correto
    expect(Factory::Dynamic.validacao_link_imagem(@response_json['message'])).to be_truthy
  end
end

E('ao fazer múltiplas requisições, as imagens retornadas devem ser diferentes') do
  imagens_aleatorias = 5.times.map do
    response = Excon.get(Factory::Static.static_data('urls')['url_imagem_aleatoria'])
    JSON.parse(response.body)['message']
  end

  expect(imagens_aleatorias.uniq.size).to be > 1
end
