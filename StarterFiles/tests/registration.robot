*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser
Test Setup    Go To    ${URL}

*** Variables ***
${URL}      http://localhost:7272/Registration.html
${BROWSER}  chrome

*** Test Cases ***
UAT-Lab04-001 Register Success
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

UAT-Lab04-001 Register Success No Organization Info
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

UAT-Lab04-002 Empty First Name
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    *Please enter your first name!!

UAT-Lab04-002 Empty Last Name
    Input Text    id=firstname     Somyod
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    *Please enter your last name!!

UAT-Lab04-002 Empty First Name and Last Name
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    *Please enter your name!!

UAT-Lab04-002 Empty Email
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    *Please enter your email!!

UAT-Lab04-002 Empty Phone Number
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Click Button  id=registerButton
    Page Should Contain    *Please enter your phone number!!

UAT-Lab04-002 Invalid Phone Number
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         1234
    Click Button  id=registerButton
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678
