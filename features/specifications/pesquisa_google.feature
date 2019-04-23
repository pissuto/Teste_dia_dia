#language:pt

Funcionalidade: Pesquisa no Google

    Sendo um usuario qualquer
    Posso acessar o site do Google
    Para fazer uma pesquisa

@sprint1
Cenario: Pesquisa

    Dado que estou no site do Google
    Quando realiza uma buscar por:
    |pesquisa|Guilherme Pissuto|
    Então vejo o seguinte texto:
    """
    Guilherme Pissuto
    """