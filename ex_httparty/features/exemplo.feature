# language: pt
Funcionalidade: Exemplo de como utilizar Cucumber e HTTParty

Cenario: Pesquisando um CEP válido
	Dado que informei o CEP '01001001'
	Quando quando efetuar uma busca via HTTP Request 
	Então espero que seja apresentada as seguintes informações:
	| bairro | logradouro  | cep      | uf | localidade |
	| Sé     | Praça da Sé | 01001001 | SP | São Paulo  |
	
Cenario: Pesquisando um CEP inválido
	Dado que informei o CEP '05005009'
	Quando quando efetuar uma busca via HTTP Request 
	Então espero que o endereço não exista
