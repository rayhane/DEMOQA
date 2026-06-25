*** Settings ***
Documentation    Mots-clés métier pour la section Elements de DEMOQA
Library        SeleniumLibrary
Resource       ../ressource/keywords.resource
Resource       ../ressource/variables.resource

*** Keywords ***
Remplir textbox
   [Documentation]      Remplir le textbox
   [Arguments]          ${full_name}   ${email}  ${current_adrss}   ${permenant_adrss}
   Wait Until Element Is Visible   id=userName     ${TIMEOUT}
   Input Text                      id=userName     ${full_name}      
   Input Text                      id=userEmail    ${email}
   Input Text                      id=currentAddress    ${current_adrss}
   Input Text                      id=permanentAddress  ${permenant_adrss}

Ouvrir navigateur
   [Documentation]      Ouvrir navigateur       
    Open Browser          ${url}         ${Browser}    options=${chrome_options}

Fermer navigateur   
   [Documentation]     Fermer navigateur 
    Run Keyword If Test Failed     Capture Page Screenshot      
    Close Browser  

Naviguer vers
   [Documentation]     Basculer vers weburl textbox
   [Arguments]         ${url_path}
   Go To               ${url_path}
   Wait Until Page Contains Element     xpath=//h1[@class='text-center']

Vérifier champs vides
    [Documentation]    Les champs doivent être vides à l'ouverture de la page
    Textfield Value Should Be     id=userName           ${EMPTY}
    Textfield Value Should Be     id=userEmail          ${EMPTY}
    Textarea Value Should Be      id=currentAddress     ${EMPTY}
    Textarea Value Should Be      id=permanentAddress   ${EMPTY}   

Chercher element
  [Documentation]    remplir le searchbar
  [Arguments]        ${search_bar}
  Input Text      id=searchBox        ${search_bar}
  Click Button    id=basic-addon2    


Supprimer Première Ligne
    [Documentation]    Supprime la première ligne du tableau

    Wait Until Element Is Visible    id=delete-record-1    10s

    Execute JavaScript
    ...    document.getElementById('delete-record-1').scrollIntoView({block:'center'});

    Sleep    1s

    Execute JavaScript
    ...    document.getElementById('delete-record-1').click();

Premiere Ligne Doit Disparaitre
    [Arguments]    ${valeur}

    Wait Until Page Does Not Contain    ${valeur}    10s

Scroll Vers Element
    [Arguments]         ${locator}
    Scroll Element Into View    ${locator}
    Sleep               0.3s
Ajouter Ligne Web Table
    [Documentation]    Ouvre le formulaire et ajoute une ligne dans la table
    [Arguments]         ${first}    ${last}    ${email}    ${age}    ${salary}    ${dept}
    Click Button        id=addNewRecordButton
    Wait Until Element Is Visible    id=firstName    ${TIMEOUT}
    Input Text          id=firstName    ${first}
    Input Text          id=lastName     ${last}
    Input Text          id=userEmail    ${email}
    Input Text          id=age          ${age}
    Input Text          id=salary       ${salary}
    Input Text          id=department   ${dept}
    Click Button        id=submit

Vérifier Ligne Dans Table
    [Documentation]    Vérifie qu'une valeur est présente dans la table
    [Arguments]         ${valeur}
    Element Should Be Visible
   ...      xpath=//td[normalize-space(.)='${valeur}']
   # Page Should Contain    ${valeur}

Ouvrir les liens   
   [Documentation]     Basculer vers weburl link
   [Arguments]         ${url_link}
   Go To               ${url_link}
   Wait Until Page Contains Element     xpath=//h1[@class="text-center" and text()="Links"]

Naviguer premier lien

  [Documentation]     ouvrir le premier lien
    Click Element      id=simpleLink
    ${url_exact} =    Get Location
    Should Be Equal    ${url}    ${url}
   # Location Should Be    ${url}

Cocher Une Case
    [Documentation]    Coche un élément dans l'arbre CheckBox
    [Arguments]         ${label}
    ${checkbox}=        Get WebElement    xpath=//span[@class="rc-tree-title" and text()="Home"]
    Scroll Vers Element    ${checkbox}
    Click Element           ${checkbox}
    # Cocher seulement si elle n'est pas déjà cochée
    ${classes}=         Get Element Attribute    ${checkbox}    class
    IF    "rc-tree-checkbox-checked" not in "${classes}"
        Click Element    ${checkbox}
    END
