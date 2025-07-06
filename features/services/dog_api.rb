# frozen_string_literal: true

# Classe responsável por configurar os acessos a API https://dog.ceo/dog-api/documentation/
class Dog_api
  include Excon
  attr_accessor :base_uri

  def initialize
    self.base_uri = $base_uri
    @headers = { 'Content-Type' => 'application/json' }
  end

  def get(endpoint)
    Excon.get(
      $base_uri + endpoint,
      headers: @headers
    )
  end

  def delete(endpoint)
    Excon.delete(
      $base_uri + endpoint,
      headers: @headers
    )
  end

  def post(endpoint, payload)
    Excon.post(
      $base_uri + endpoint,
      body: payload.to_json,
      headers: @headers
    )
  end

  def put(endpoint, payload)
    Excon.put(
      $base_uri + endpoint,
      body: payload.to_json,
      headers: @headers
    )
  end

  def set_token(payload)
    @headers['Authorization'] = JSON.parse(post('/login', payload).body)['authorization']
  end
end
