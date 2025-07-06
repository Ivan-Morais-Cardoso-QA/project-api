# frozen_string_literal: true

Quando('realizar uma requisição GET para a rota {string}') do |path|
  @tempo_inicial = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  @response =  @serverest_api.get(path)

  @tempo_final = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  @response_json = JSON.parse(@response.body)
end

E('o tempo de resposta deve estar dentro do limite aceitável') do
  tempo_limite = Factory::Static.static_data('acessibilidade')['tempo_requisicao']
  tempo_total = @tempo_final - @tempo_inicial

  expect(tempo_total).to be < tempo_limite
end
