*** Settings ***
Library    Browser
Library		squash_tf.TFParamService


*** Variables ***
${URL}    http://automationpractice.com/index.php
${ITEM_IMG}    //*[@id="homefeatured"]/li[1]/div/div[1]/div/a[1]/img
${ITEM_ADD_TO_CART_BTN}    //span[contains(text(),"Add to cart")]
${ITEM_MORE_BTN}    //*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[2]/span
${PROCEED_TO_SUMMARY}    //span[contains(text(),'Proceed to checkout')]

*** Keywords ***
J'accède à l'URL : http://automationpractice.com/index.php
    ${browser} =	Get Test Param	DS_browser
    New Browser    browser=${browser}  headless=True
    New Page    url=${URL}
    

Je clique sur l'article Faded Short Sleeve T-shirts
    Wait For Elements State    ${ITEM_IMG}    visible    20
    Scroll To Element    ${ITEM_IMG}
    Mouse Move Relative To    ${ITEM_IMG}
    Wait For Elements State    ${ITEM_MORE_BTN}    visible    20
    Scroll to Element    ${ITEM_MORE_BTN}
    Click   ${ITEM_MORE_BTN}

Je clique sur le bouton Add to Cart
    Click    ${ITEM_ADD_TO_CART_BTN}

L'article est bien ajouté et une popup apparait avec le message de confirmation suivant : Product successfully added to your shopping cart Les boutons Continue Shopping et Proceed to checkout sont présents
     Wait For Elements State    ${PROCEED_TO_SUMMARY}    visible    20