*** Settings ***
Documentation    Mots-clés métier pour la section Elements de DEMOQA
Library        SeleniumLibrary
Resource       ../ressource/keywords.resource
Resource       ../ressource/variables.resource

Suite Setup     Ouvrir navigateur
#Suite Teardown  Fermer navigateur   
Test Setup      Naviguer vers    ${url_web}

*** Test Cases ***
TC01- SearchBar
   [Documentation]    tester le webtab
   [Tags]             smoke    elements    web_table
   Chercher element   
   ...  ${search_bar}
   Sleep         0.5s
    Element Should Be Visible      xpath=//td[text()='Cierra']
    Element Should Not Be Visible  xpath=//div[@class='rt-td' and text()='Alden']

TC02- Supprimer Element
    [Documentation]    Supprime la première ligne et vérifie sa disparition
    [Tags]    elements    regression    webtables
    Naviguer vers    ${url_web}
    ${prenom}=    Get Text    xpath=//tbody/tr[1]/td[1]
    Supprimer Première Ligne
    Premiere Ligne Doit Disparaitre    ${prenom}

TC03 - Ajouter Un Nouvel Employé
    [Documentation]    Ajoute une ligne et vérifie sa présence dans la table
    [Tags]             regression    elements    webtables
    Ajouter Ligne Web Table
    ...    Sarra
    ...    Mansouri
    ...    sarra.mansouri@test.com
    ...    28
    ...    45000
    ...    QA
    Vérifier Ligne Dans Table    Sarra
    Vérifier Ligne Dans Table    Mansouri
    Vérifier Ligne Dans Table    QA    