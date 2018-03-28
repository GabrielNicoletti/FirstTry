*** Settings ***
Library  Selenium2Library

*** Variables ***

*** Keywords ***

Close EWI
    close browser

Navigate to Status Page
   click link  css=#top-horiz-navbar-button-bar > li.navbar-button.status > a
   sleep    3s

Navigate to Advanced Page
   click link  css=#nav_advanced
   sleep    3s

Check if support tab does not exist
    page should not contain element  xpath=//*[@id="top-horiz-navbar-button-bar"]/li[6]/a
    sleep   3s

Open EWI
    [Arguments]  ${IP_ADDRESS}  ${BROWSER}
    open browser  ${IP_ADDRESS}  ${BROWSER}
    MAXIMIZE BROWSER WINDOW