*** Settings ***
Documentation       Tests de la page Text Box — https://demoqa.com/text-box
Resource            ../ressource/keywords.resource
Resource            ../ressource/variables.resource

Suite Setup     Ouvrir navigateur
#Suite Teardown  Fermer navigateur   
Test Setup      Naviguer vers    ${url_path}

*** Test Cases ***
TC01 - Remplir textbox à tester
    [Documentation]    Vérifie que le formulaire Text Box affiche bien les données saisies
    [Tags]             smoke    elements    text_box
    
    Remplir textbox          
    ...    ${full_name}
    ...    ${email} 
    ...    ${current_adrss}
    ...    ${permenant_adrss}
TC03 - Vérifier Que Les Champs Sont Vides Au Chargement
    [Documentation]    Les champs doivent être vides à l'ouverture de la page
    [Tags]             smoke    elements    text_box
    Vérifier champs vides