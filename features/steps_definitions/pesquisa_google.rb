Dado('que estou no site do Google') do
  faz_pesquisa.load
end

Quando('realiza uma buscar por:') do |table|
  @aaa = table.rows_hash
  faz_pesquisa.fazer_pesq(@aaa)
end

Então('vejo o seguinte texto:') do |mensagem|
  expect(page).to have_content(mensagem)
  sleep 5
end