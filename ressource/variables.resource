*** Settings ***
Documentation    Configuration globale du projet DEMOQA 
  
*** Variables ***
#url de base
${url}    https://demoqa.com/
${Browser}    chrome
${chrome_options}     add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
${url_path}   https://demoqa.com/text-box
#time à attendre
${TIMEOUT}          10s
#Donnés de text box full name , email, adress permanent, adress actuel
${full_name}     rayhane
${email}         rayhane78@gmail.com
${current_adrss}   11 rue de liberté tunisie
${permenant_adrss}  14 rue des fleurs  
#url web
${url_web}         https://demoqa.com/webtables
#element pour webtable
${search_bar}     Cierra
#Valeur pour vérifier un élément dans le tableau
${valeur}     Sarra
#url pour lien 
${url_link}    https://demoqa.com/links
#url checkbox
${url_check}   https://demoqa.com/checkbox
