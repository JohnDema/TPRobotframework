*** Settings ***

Library    SeleniumLibrary    

*** Variables ***

# Url de base pour se connecter au site
${url}    https://www.saucedemo.com/

# Données de compte standard et d'utilisateur bloqué
${standardUser}    standard_user
${lockedUser}    locked_out_user    
${mdp}    secret_sauce

# Données utilisées pour remplir les inputs d'informations utilisateurs
${firstName}    John
${lastName}    Totoro
${codePostal}    59000

# Descriptif d'un objet
${price}    $9.99
${title}    Sauce Labs Bike Light
${descritpion}    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.

# Message qui s'affiche lorsque l'on finalise la commande
${messageValidationOrder}    Thank you for your order!

# Message qui s'affiche lorsque l'on se connecte avec un compte bloqué
${messageErrorLogin}    Epic sadface: Sorry, this user has been locked out.

# Valeurs pour dropdown qui tri les items 
${highToLow}    hilo
${lowToHigh}    lohi

# Text du dropdown qui tri les items
${fromHighToLow}    Price (high to low)
${fromLowToHigh}    Price (low to high)

# Permet de se rendre sur le deuxième item de la liste sur la page inventory 
${selectItem}    2

# Permet de checker la quantité d'élément dans le cart
${elementInCart}    1