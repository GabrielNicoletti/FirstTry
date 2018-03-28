*** Settings ***
Library  Selenium2Library

*** Variables ***

*** Keywords ***

Click Login Button
    click element  css=#banner>span
    click button  login_btn
    sleep   3s

EWI Logout
    click link  css=#page-header-link > ul > li:nth-child(3) > a
    sleep  3s

#EWI Login
#    [Arguments]  ${USERNAME}  ${PASSWORD}
#    input text  id=user_name_field  ${USERNAME}
#    input text  id=password_field  ${PASSWORD}
#    click button  login_btn
#    sleep  3s

EWI Login
    [Arguments]  ${USERNAME_2}  ${PASSWORD_2}
    Input username  ${USERNAME_2}
    Input password  ${PASSWORD_2}
    #click button  login_btn
    Click Login Button


Input username
    [Arguments]  ${USERNAME}
    input text  id=user_name_field  ${USERNAME}
    sleep  1s

Input password
    [Arguments]  ${PASSWORD}
    input text  id=password_field  ${PASSWORD}
    sleep  1s

