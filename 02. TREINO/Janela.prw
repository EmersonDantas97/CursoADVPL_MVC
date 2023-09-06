#INCLUDE 'Protheus.ch'
#INCLUDE 'Totvs.ch'

User Function Janela()

    // Variaveis de testo
    Local cTitulo := "PROGRAMADOR ADVPL"
    Local cNome := Space(60)
    Local cEndereco := Space(100)
    
    // Objetos
    Local oJanela
    Local oNome
    Local oEndereco
    Local oButton
 
    // Criando uma Janela
    oJanela := TDialog():New(180,180,550,700,cTitulo,,,,,CLR_BLACK,CLR_WHITE,,,.T.)

    // Conteudo pre digitado 
    cNome := "Digite aqui"

    // Caixa de texto
    oNome := TGet():New( 20,20,{|u|IIF(Pcount()>0,cNome:=u,cNome)},oJanela,096,009,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNome,,,, )
    /*
    20,20 é a posição do objeto
    oJanela é o objeto que vai receber meu elemento
    */

    cEndereco := "Digite se endereço"
    oEndereco := TGet():New( 40,20,{|u|IIF(Pcount()>0,cEndereco:=u,cEndereco)},oJanela,096,009,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cEndereco,,,, )

    // Criando um botao
    oButton := TButton():New( 60, 20, "Verificar Conteúdo",oJanela,{||MsgInfo(cNome, "Voce Digitou...")}, 80,20,,,.F.,.T.,.F.,,.F.,,,.F. )

    // Ativando uma janela
    oJanela:Activate(,,,.T.)

Return

