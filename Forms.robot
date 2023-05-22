*** Settings ***
Documentation  Funcionalidade preehncer formulário pegando vários tipos de elementos
Resource  ../Project_robot/Resources/e2e/FormsPage.robot

Test Setup   FormsPage.Start Test
Test Teardown   FormsPage.Finish TestCase

*** Test Cases ***
#Preencher formulario com sucesso
 #  [Documentation]  objetivo de prencher o fomulario corretamente sem erros 
  # [tags]  Funcional
  # Dado que esteja no site da Tools
   #Quando clico em Forms
  # E preencho first name "Caio" , last name "Augusto" E-mai "caio18augusto@outlook.com"
  # E seleciono "Masculino"
  # E preencho "telefone", "Date of birth"
  # E seleciono Subject , "Hobbies"
 #  E adiciono uma imagem 
  # E preencho "Current address" , "State and City"
  # Quando clico em submit
  # Então devo validar os campos corretamente 

Preencher formulario sem campos obrigatorios
    [Documentation]  objetivo de prencher o fomulariosem os campos obrigatorios e validar quais sao
    [tags]  camposObrigatorios
    Dado que esteja no site da Tools
    Quando clico em Forms
    E seleciono "Masculino"
    E preencho "telefone", "Date of birth"
    E seleciono Subject , "Hobbies"
    E adiciono uma imagem 
    E preencho "Current address" , "State and City"
    Quando clico em submit
    Validar se os campos obrigatorios estao preenchidos
    
 #Inserir primeiro nome, ultimo nome e email aleatório
   #  [Documentation]  nos campos email, nome e ultimo nome gerar dados aleatorios
     #[tags]  aleatorio
     #Dado que esteja no site da Tools
     #Quando clico em Forms
     #Gerar Nomes aleatorios