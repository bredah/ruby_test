#encoding: utf-8
#!/usr/bin/env ruby

@cep 
@reponse

Dado(/^que informei o CEP '(\d+)'$/) do |cep|
  # Armazena o CEP informado
  @cep = cep
end

Quando(/^quando efetuar uma busca via HTTP Request$/) do
  # Efetua requisição HTTP
  @response = HTTParty.get("http://cep.correiocontrol.com.br/#{@cep}.json")
  # Válida o código de reposta da requisição
  expect(@response.code).to eq(200)
end

Então(/^espero que seja apresentada as seguintes informações:$/) do |table|
  json_reponse = JSON.parse(@response.body)
  # Válida: Corpo da reposta
  expect(true).to eq(check_json(@response.body))
  # Válida: Bairro 
  expect(table.hashes[0]['bairro']).to eq(json_reponse['bairro'])
  # Válida: Logradouro
  expect(table.hashes[0]['logradouro']).to eq(json_reponse['logradouro'])
  # Válida: CEP
  expect(table.hashes[0]['cep']).to eq(json_reponse['cep'])
  # Válida: UF
  expect(table.hashes[0]['uf']).to eq(json_reponse['uf'])
  # Válida: Localidade
  expect(table.hashes[0]['localidade']).to eq(json_reponse['localidade'])
end

Então(/^espero que o endereço não exista$/) do
  # Válida: Corpo da resposta
  expect(false).to eq(check_json(@response.body))
end

# Verifica se o JSON não retornou com erro
def check_json(json)
  begin
    JSON.parse(json)
    return true
  rescue Exception => e
    return false
  end
end