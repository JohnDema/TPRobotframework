*** Settings ***

Library    SeleniumLibrary    run_on_failure=None
Library    collections
Library    string    
Library    Screenshot

Resource    Keywords_sauce_demo.robot
Resource    Variables_sauce_demo.robot

*** Test Cases ***

Test cas numéro 1

    Given Im on the logpage    ${url}
    Element Should Be Visible    //input[@id="login-button"]    # Si le bouton login est présent, alors nous sommes sur la page de connexion
    When Im connected Im on the inventory page  ${standardUser}    ${mdp}
    Element Should Be Visible    //button[@id="react-burger-menu-btn"]    # Si le burger button est affiché, alors nous somme bien connecté
    Then I can log out from the logout button
    Element Should Be Visible    //input[@id="login-button"]    # Si le bouton login est présent, alors nous sommes déconnectés

Test cas numéro 2

    Given Im on the logpage    ${url}
    Element Should Be Visible    //input[@id="login-button"]    # Si le bouton login est présent, alors nous sommes sur la page de connexion
    When I try to connect with a locked account    ${lockedUser}    ${mdp}
    Then I get an error message    ${messageErrorLogin}

Test cas numéro 3

    Given Im on the logpage    ${url}
    When Im connected Im on the inventory page  ${standardUser}    ${mdp}
    Then I can sort of the items by price    ${highToLow}
    Element Text Should Be    //*[text()="Price (high to low)"]    ${fromHighToLow}    # La valeur actuelle du dropdown est bien affichée
    Then I can add the two first items
    Then I can go to the cart
    Element Text Should Be    //*[@class="shopping_cart_badge"]    2    # Le logo du cart est bien modifié selon le nombre d'item présent dans le cart
    Then I can type my informations and go to the recap page order    ${firstName}    ${lastName}    ${codePostal}
    Then I can finalize the order
    Element Text Should Be    //*[text()="Thank you for your order!"]    ${messageValidationOrder}    # Après la validation de la confirmation de la commande, le message de validation s'affiche

Test cas numéro 4

    Given Im on the logpage    ${url}
    When Im connected Im on the inventory page  ${standardUser}    ${mdp}
    Then I can sort of the items by price    ${highToLow}
    Element Text Should Be    //*[text()="Price (high to low)"]    ${fromHighToLow}    # La valeur actuelle du dropdown est bien affichée, du plus cher au moins cher
    Then I can sort of the items by price    ${lowToHigh}
    Element Text Should Be    //*[text()="Price (low to high)"]    ${fromLowToHigh}    # La valeur actuelle du dropdown est bien affichée, du moins cher au plus cher

Test cas numéro 5

    Given Im on the logpage    ${url}
    When Im connected Im on the inventory page  ${standardUser}    ${mdp}
    Then I can go the second item, see the details page of the product and add it to the cart    ${selectItem}
    Element Text Should Be    //div[contains(@class, "inventory_details_name large_size")]    ${title}    # Le titre correspond aux données
    Element Text Should Be    //div[contains(@class, "inventory_details_price")]    ${price}    # Le prix est correctement affiché
    Element Text Should Be    //div[contains(@class, "inventory_details_desc large_size")]    ${descritpion}    # La description correspond à l'objet
    Element Should Be Visible    //div[contains(@class, "inventory_details_img")]    # L'image s'affiche sur le site
    Element Text Should Be    //*[@class="shopping_cart_badge"]    ${elementInCart}    # Le logo du cart est bien modifié selon le nombre d'item présent dans le cart
    Then I can go to the cart
    Element Text Should Be    //div[@class="cart_quantity"]    ${elementInCart}    # Le nombre d'item présent dans le cart est correcte



