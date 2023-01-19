*** Settings ***
Library    Browser
Library    String

*** Variables ***
#locators
${women_title_page}    //title    
${women_checkbox_dresses}    //input[@value="8"]
${women_checkbox_size_S}    //input[@value="1_1"]
${women_sort_by_select}    //select[@id="selectProductSort"]
${Number_product}    //*[@id="center_column"]/h1/span[2]/span
${Print_summer_dress_article}    //*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a
${ADD_to_cart_button_dress}    //*[@id="center_column"]/ul/li[3]/div/div[2]/div[2]/a[1]/span    

*** Keywords ***
I Am On The Women Page
    Get Title    ==   Women - My Store
I Apply The Filters "Dresses" And Size "S" On The Articles 
    ${dresses_ischecked}    Get Checkbox State    ${women_checkbox_dresses}    ==    unchecked
    IF    ${dresses_ischecked} == False
        Check Checkbox    ${women_checkbox_dresses}
    END 
    ${size_S_ischecked}    Get Checkbox State    ${women_checkbox_size_S}    ==    unchecked
    IF    ${size_S_ischecked} == False
        Check Checkbox    ${women_checkbox_size_S}
    END 
I Sort The Items By Ascending Price
    Select Options By    ${women_sort_by_select}    value    price:asc
    
            
           

        