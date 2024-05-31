*** Settings ***

Library    SeleniumLibrary
Library    Collections

*** Keywords ***

Given Im on the logpage
    [Arguments]    ${setUrl}
    Open Browser     ${setUrl}
    Maximize Browser Window


When Im connected Im on the inventory page
    [Arguments]    ${setUser}    ${setPassword}
    
    Input Text    //input[@id="user-name"]    ${setUser}
    Input Password    //input[@id="password"]    ${setPassword}
    Click Button   //input[@id="login-button"]

Then I can log out from the logout button 

    Click Button    //button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    //a[@id="logout_sidebar_link"]
    Click Element    //*[contains(@id,"logout_sidebar_link")]

When I try to connect with a locked account
    [Arguments]    ${setUser}    ${setPassword}
    
    Input Text    //input[@id="user-name"]    ${setUser}
    Input Password    //input[@id="password"]    ${setPassword}
    Click Button   //input[@id="login-button"]

Then I get an error message
    [Arguments]    ${messageSystem}  

    Element Text Should Be    //*[text()="Epic sadface: Sorry, this user has been locked out."]    ${messageSystem}

Then I can sort of the items by price
    [Arguments]    ${sort}

    Click Element    //*[@class="product_sort_container"]
    Select From List By Value    //*[@class="product_sort_container"]    ${sort}

Then I can add the two first items

        @{itemList}   Create List
    FOR  ${setIndexNumber}  IN RANGE    1    3
        ${element}    Get Text     (//*[@class="btn btn_primary btn_small btn_inventory "])[${setIndexNumber}]
        Append To List    ${itemList}    ${element}
        Click Element    locator=(//*[@class="btn btn_primary btn_small btn_inventory "])
    END
        Length Should Be    ${itemList}    2

    # Click Element    (//*[@class="btn btn_primary btn_small btn_inventory "])[${setItem}] (Autre méthode pour sélectionner les éléments dans l'ordre que l'on souhaite)

Then I can go to the cart

    Click Element    //*[@id="shopping_cart_container"]

Then I can type my informations and go to the recap page order
    [Arguments]    ${setFirstname}    ${setLasname}    ${setCodepostal}

    Click Button    //button[@id="checkout"]
    Input Text    //input[@id="first-name"]   ${setFirstname}
    Input Text    //input[@id="last-name"]    ${setLasname}
    Input Text    //input[@id="postal-code"]    ${setCodepostal}
    Click Element    //input[@id="continue"]

Then I can finalize the order

    Click Button    //button[@id="finish"]

Then I can go the second item, see the details page of the product and add it to the cart
    [Arguments]    ${setItem}

    Click Element    (//*[@class="inventory_item_name "])[${setItem}]
    Click Element    //button[@id="add-to-cart"]









    