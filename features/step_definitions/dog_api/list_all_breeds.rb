# frozen_string_literal: true

Então('a resposta deve conter todas as raças cadastradas no formato correto') do
  aggregate_failures do
    todas_racas           = Factory::Static.static_data('todas_racas')
    response_esperado     = Factory::Static.static_data('response')
    content_type_esperado = Factory::Static.static_data('json_informacoes')['content_type']

    # Valida status e headers
    expect(@response.status).to eq(response_esperado['sucess']['code'])
    expect(@response.headers['Content-Type']).to eq(content_type_esperado)

    # Valida estrutura do JSON
    expect(@response_json).to include('message', 'status')
    expect(@response_json['message']).to be_a(Hash)
    expect(@response_json['status']).to eq(response_esperado['sucess']['message'])

    # Valida que todos os valores do campo "message" são arrays
    expect(@response_json['message'].values).to all(be_an(Array))

    # Valida se o endpoint retorna as raças e sub raças específicas
    %w[bulldog australian bakharwal hound mastiff].each do |raca|
      expect(@response_json['message']).to have_key(raca)
      expect(@response_json['message'][raca]).to eq(todas_racas[raca])
    end
  end
end
