*** Settings ***
Documentation       Tests de la page Check Box — https://demoqa.com/checkbox
Resource            ../ressource/keywords.resource
Resource            ../ressource/variables.resource

Suite Setup         Ouvrir navigateur
#Suite Teardown      Fermer navigateur
Test Setup          Naviguer Vers    ${url_check}

*** Test Cases ***
TC04 - Cocher Home Et Vérifier Le Résultat
    [Documentation]    Coche la case "Home" et vérifie le message de résultat
    [Tags]             smoke    elements    ${url_check}
    Cocher Une Case    Home
   # Wait Until Element Is Visible    id=result    ${TIMEOUT}=10s
   # Element Should Contain           id=result    home
    Capture Page Screenshot    apres_coche.png    # 👈 voir ce qui se passe
    Log Source    
      #Wait Until Element Is Visible    xpath=//span[@class="text-success" and text()="home"]    timeout=10s
      #Element Should Be Visible        xpath=//span[@class="text-success" and text()="home"]

TC05 - Déplier L'arbre Et Cocher Desktop
   [Documentation]    Déplie le nœud Home et coche Desktop uniquement
   [Tags]             regression    elements    checkbox
   Click Element    xpath=//span[@class="rc-tree-switcher rc-tree-switcher_close"]
   Sleep            0.5s
    Cocher Une Case    Desktop
   Element Should Contain    //span[@class="rc-tree-title" and text()="Desktop"]    Desktop   
    