*** Settings ***
Documentation     Suite description
Library           String
Library           BuiltIn
Library           DateTime
Library           Dialogs
Library           Selenium2Library    
Library           Collections
Library           OperatingSystem
Library			  SikuliLibrary



*** Test Cases ***
Creat Chrome Browser And Login To Flipkart
    Create Browser And Set Capabilities
    Login To Flipkart


*** Variables ***
${DirName}		    Reshma
${BROWSER}		    gc
${LOGIN}            //a[text()="Log In"]
${USERNAME}         //span[text()='Enter Email/Mobile number']//parent::label//parent::div/input
${PASSWORD}         //span[text()='Enter Password']//parent::label//parent::div/input
${LOGIN_BTN}        //span[text()='Login']//parent::button


*** Keywords ***

Create Browser And Set Capabilities
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument      always-authorize-plugins
    Call Method    ${options}    add_argument      enable-npapi
    Create WebDriver  Chrome    chrome_options=${options}
    Go To    https://www.flipkart.com/

Login To Flipkart
    Selenium2Library.Click Element      ${LOGIN}
    Selenium2Library.Input Text         ${USERNAME}     reshma9n@gmail.com
    Selenium2Library.Input Password     ${PASSWORD}     reshma9nov
    Selenium2Library.Click Element      ${LOGIN_BTN}

