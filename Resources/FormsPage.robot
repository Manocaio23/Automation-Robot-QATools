*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#trocar no local que mouda de site
${site}  qa
&{url}  qa=https://demoqa.com/  prod=http://ambienteproducao.com  test=https://www.ebay.com
${browser}   chrome
${qa}    https://demoqa.com/
${FORMS_BTN}    //body/div[@id='app']/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[3]
${PRATIC_BTN}    //span[contains(text(),'Practice Form')]
${FIRSTNAME_INPUT}    //input[@id='firstName']
${LASTNAME_INPUT}     //input[@id='lastName'] 
${EMAIL_INPUT}        //input[@id='userEmail'] 
${MASCULINO_RADIO}    id:gender-radio-1
${NUMBER_INPUT}       //input[@id='userNumber']
${DATEBIRTH_DATE}     //input[@id='dateOfBirthInput']
${NEXT_MONTH}         //button[contains(text(),'Next Month')]
${DAY}                //*[@id="dateOfBirth"]/div[2]/div[2]/div/div/div[2]/div[2]/div[4]/div[5]
${MALE_CHECK}        id:gender-radio-1
${SELECT_YEAR}        //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[2]/form[1]/div[5]/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/select[1]
${SUBJECT_INPUT}     id:subjectsContainer
${SPORTS_CHECKBOX}    //label[contains(text(),'Sports')]
${MUSIC_CHECKBOX}    id:hobbies-checkbox-3
${UPLOAD}        id:uploadPicture
${UPLOAD_PATH}    C:/Users/CAIO/Downloads/logopelada.jpg
${CURRENTADRESS_TEXTAREA}    id:currentAddress
${SELECT_STATE}    //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[2]/form[1]/div[10]/div[2]
${SELECT_CITY}    //body/div[@id='app']/div[1]/div[1]/div[2]/div[2]/div[2]/form[1]/div[10]/div[3]/div[1]/div[1]/div[1]
${SELECT_NCR}     //div[contains(text(),'NCR')]
${SELECT_DELHI}        //div[contains(text(),'Delhi')]
${SUBMIT}    id:submit

*** Keywords ***
Start Test
    Open Browser  ${qa}   ${browser}
    Maximize Browser Window
    

Finish TestCase
    Close Browser

Dado que esteja no site da Tools
   Sleep   1s
    
Quando clico em Forms 
    Click Element    locator=${FORMS_BTN}
    Sleep   1s
    Click Element    locator=${PRATIC_BTN}
   
    
E preencho first name "${NAME}" , last name "${lAST_NAME}" E-mai "${E-mail}"
     Sleep   1s
     Input Text   ${FIRSTNAME_INPUT}       ${NAME}
     Input Text   ${LASTNAME_INPUT}        ${lAST_NAME}
     Input Text   ${EMAIL_INPUT}       ${E-mail}
     Sleep   1s



E seleciono "Masculino"
     Page Should Contain Radio Button    ${MALE_CHECK}    
     Press Keys    ${MALE_CHECK}       TAB
     Sleep   1s
   

E preencho "telefone", "Date of birth"
  Input Text   ${NUMBER_INPUT}        8199999999
  Sleep   1s
  Click Element    locator=${DATEBIRTH_DATE}
  Sleep   1s
  Click Button    locator=${NEXT_MONTH} 
  Sleep   1s  
  Select From List By Label   ${SELECT_YEAR}     1996 
  Sleep   1s
  Element Should Be Visible     ${DAY} 
  Click Element    ${DAY} 
  Sleep   1s

E seleciono Subject , "Hobbies"
  Sleep   1s
  Page Should Contain Element      ${SUBJECT_INPUT}
  Press Keys     ${SUBJECT_INPUT}    SPACE
  Sleep   2s
  Page Should Contain Element   ${SUBJECT_INPUT} 
  Sleep   1s
  Page Should Contain Element  ${MUSIC_CHECKBOX}
  Press Keys     ${MUSIC_CHECKBOX}    TAB
  Press Keys     ${MUSIC_CHECKBOX}    TAB
  Sleep   1s

E adiciono uma imagem 
    Choose File       ${UPLOAD}    ${UPLOAD_PATH}  
    Sleep   1s
E preencho "Current address" , "State and City"
    Input Text   ${CURRENTADRESS_TEXTAREA}    text
    Sleep   1s
    Scroll Element Into View    locator=${SELECT_STATE} 
    Click Element    locator=${SELECT_STATE} 
    Click Element    locator=${SELECT_NCR}
    Sleep   1s
    Click Element    locator=${SELECT_CITY}
    Click Element    locator=${SELECT_DELHI}
    Sleep   1s

Quando clico em submit
    Click Button    ${SUBMIT}
    
Então devo validar os campos corretamente 
    Sleep   5s
    Page Should Contain  Thanks for submitting the form
    Page Should Contain   Caio Augusto
    Page Should Contain  caio18augusto@outlook.com
    Page Should Contain   Male
    Page Should Contain  8199999999
    Page Should Contain  22 February,1996
    Page Should Contain  Computer Science
    Page Should Contain  Music
    Page Should Contain  logopelada.jpg
    Page Should Contain	text
    Page Should Contain   NCR Delhi

Validar se os campos obrigatorios estao preenchidos
    Sleep   5s
    Element Text Should Not Be  ${FIRSTNAME_INPUT}  valor 
    Element Text Should Not Be  ${LASTNAME_INPUT}  valor
   