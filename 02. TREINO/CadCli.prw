#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'
#INCLUDE 'TOPCONN.CH'

User Function CADSA2()

    // Variavel tipo array para deixar a tela responsiva
    Local aSize := MsAdvSize()

    // Declaração de cVariable dos componentes
    Private cCodigo    := Space(6)
    Private cEndereco  := Space(100)
    Private cNome      := Space(50)
    Private cLoja      := Space(2)

    // Declaração de Variaveis Private dos Objetos
    SetPrvt("oJanela","oSay1","oSay2","oSay3","oSay4","oGet1","oGet2","oGet3","oBtn1","oGet4")

    // Definicao do Dialog e todos os seus componentes
    oJanela      := MSDialog():New( aSize[7],aSize[1],aSize[6],aSize[5],"Tela de Cadastro AdvPL",,,.F.,,,,,,.T.,,,.T. )
    
    // Labels
    oSay1      := TSay():New( 008,012,{||"Código"},oJanela,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSay2      := TSay():New( 008,096,{||"Nome"},oJanela,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSay3      := TSay():New( 033,012,{||"Endereço"},oJanela,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSay4      := TSay():New( 033,143,{||"Loja"},oJanela,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    
    // Caixas de texto
    oGet1      := TGet():New( 016,012,{|u| If(PCount()>0,cCodigo:=u,cCodigo)},oJanela,080,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCodigo",,)
    oGet2      := TGet():New( 016,096,{|u| If(PCount()>0,cNome:=u,cNome)},oJanela,116,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cNome",,)
    oGet3      := TGet():New( 041,012,{|u| If(PCount()>0,cEndereco:=u,cEndereco)},oJanela,128,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cEndereco",,)
    oGet4      := TGet():New( 041,143,{|u| If(PCount()>0,cLoja:=u,cLoja)},oJanela,069,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cLoja",,)
    
    // Botões
    oBtn1      := TButton():New( 060,012,"Cadastrar",oJanela,{|| fGrava()},037,012,,,,.T.,,"",,,,.F. )
    oBtn2      := TButton():New( 060,052,"Sair",oJanela,{|| oJanela:End()},037,012,,,,.T.,,"",,,,.F. )
    
    // Ativando a janela
    oJanela:Activate(,,,.T.)

Return

Static Function fGrava()

    Local cTabela := 'SA1'

    RecLock(cTabela,.T.) // RecLok é a funcao utilizada pra gravar infos no banco de dados
        SA1->A1_COD     := cCodigo
        SA1->A1_LOJA    := cLoja
        SA1->A1_NOME    := cNome
        SA1->A1_END     := cEndereco    
    MsUnlock() // Fechando conexao com o banco de dados

    // Mostando mensagem de sucesso
    MsgInfo("Cliente cadastrado com Sucesso!", "SUCESSO")

Return
