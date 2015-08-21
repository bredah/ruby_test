#encoding: utf-8
#!/usr/bin/env ruby

@productDescription 

Before do
    # Maximiza o navegador
    page.driver.browser.manage.window.maximize
    # Carrega a URL do página do ambiente de PROD
    visit 'http://www.walmart.com.br'
end

Dado(/^que informei o termo '(.+?)'$/) do |termo|
	# Preenche o campo de busca
    place = page.find_by_id('suggestion-search').native
    place.send_keys("#{termo}")
    click_on('Procurar')
    # Verifica se algum item foi apresentado
    expect(page).to have_xpath('.//div[@id="category-products"]//li[@itemprop="itemListElement"]')
end



E(/^selecionei o produto '(.+?)'$/) do |produto|
    @produto = produto
    expect(page).to have_content("#{produto}")
    click_link("#{produto}")
end

Quando(/^adicionar o produto ao carrinho/) do
    # Verifica se a página carregou o produto correto
    expect(page).to have_content(@productDescription)
    # Adiciona o produto ao carrinho
    click_on('Adicionar ao carrinho')
    # Caso apareca o modal do garantia
    expect(page).to have_button('Continuar')
    click_on('Continuar')
end

Então(/^espero que o produto seja apresentado no carrinho$/) do
    page.find(:xpath, "//div[@class='cart']/a").click
    # Verifica se o produto é apresentado no carrinho
    expect(page).to have_content(@productDescription)
end