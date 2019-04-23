Dir[File.join(File.dirname(__FILE__),
    '../pages/*_page.rb')].each { |file| require file }

# Modulos para chamar as classes instanciadas
module Pages
    def faz_pesquisa
        @faz_pesquisa ||= FazPesquisa.new 
    end
end
