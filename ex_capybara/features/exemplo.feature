# language: pt
Funcionalidade: Exemplo de como utilizar Cucumber, Capybara e Selenium

Cenario: Pesquisando produto
	Dado que informei o termo 'tv'
	E selecionei o produto 'Smart TV LED Full HD 43" LG 43LF6350 WebOS 3 USB 3 HDMI Wi-fi integrado'
	Quando adicionar o produto ao carrinho
	Então espero que o produto seja apresentado no carrinho