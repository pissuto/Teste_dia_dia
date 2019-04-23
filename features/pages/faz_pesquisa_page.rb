class FazPesquisa < SitePrism::Page
  set_url '/'
  element :pesquisa, 'input[name=q]'
  element :button_pesquisa, 'input[name=btnK]'

  def fazer_pesq(t_a)
    pesquisa.set t_a['pesquisa']
    button_pesquisa.click  
  end
end