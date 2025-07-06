# frozen_string_literal: true

# Módulo de fábricas utilizadas em testes automatizados
module Factory
  # Classe responsável por fornecer dados estáticos para testes automatizados
  class Static
    def self.load_file
      YAML.load_file(File.dirname(__FILE__) + "/static/#{ENVIRONMENT}.yml")
    end

    def self.static_data(data)
      Static.load_file[data]
    end
  end
end
