*** Settings ***
Documentation    Mots-clés métier pour la section Elements de DEMOQA
Library        SeleniumLibrary
Resource       ../ressource/keywords.resource
Resource       ../ressource/variables.resource

Suite Setup     Ouvrir navigateur
#Suite Teardown  Fermer navigateur   
Test Setup      Ouvrir les liens    ${url_link}
*** Test Cases ***
TC05- Ouvrir lien
   Naviguer premier lien     
     


