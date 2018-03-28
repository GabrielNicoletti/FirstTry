*** Settings ***
Documentation  This is my first script using robot ever
Library  Selenium2Library
Resource  ../Resources/CommonLogin.robot
Resource  ../Resources/BasicsApp.robot
Resource  ../Resources/PO/Status.robot
Resource  ../Resources/PO/Advanced.robot

Suite Setup  BasicsApp.Open EWI  ${DEFAULT_EWI_ADDRESS}  ${DEFAULT_BROWSER}
Test Setup  CommonLogin.EWI Login  ${DEFAULT_SUPPORT_USERNAME}  ${DEFAULT_SUPPORT_PASSWORD}
Test Teardown    CommonLogin.EWI Logout
Suite Teardown  BasicsApp.Close EWI

*** Variables ***
${DEFAULT_BROWSER} =  chrome
${DEFAULT_EWI_ADDRESS} =  http://192.168.1.1
${DEFAULT_SUPPORT_USERNAME} =  support
${DEFAULT_SUPPORT_PASSWORD} =  support

*** Test Cases ***
User must go to status page and navigate through all its tabs
    [Documentation]  User must go to status page and navigate through all its tabs

    BasicsApp.Navigate to Status Page
    Status.Click Internet tab
    Status.Click Connection Tab
    Status.Click Devices tab
    Status.Click Ethernet tab
    Status.Click Wireless tab
    Status.Click NAT tab
    Status.Click Routing tab
    Status.Click Security tab

User must be able to go only to ethernet page

    BasicsApp.Navigate to Status Page
    Status.Click Ethernet tab

User must go advanced page - security - set admin credentials to not required and get back in without logging in
    [Documentation]  User must go advanced page - security - set admin credentials to not required and get back in without logging in
    [Tags]  Current  Tag
    BasicsApp.Navigate to Advanced Page
    #Advanced.Click Security tab
    #this mouseover test is currently working for chrome only
    Advanced.Mouse Over Security tab
    Advanced.Click admin credentials
    Advanced.Set credentials to not required
    Advanced.Click credentials apply button
    CommonLogin.EWI Logout
    BasicsApp.Close EWI
    BasicsApp.Open EWI  ${DEFAULT_EWI_ADDRESS}  ${DEFAULT_BROWSER}
    BasicsApp.Check if support tab does not exist

Verify ONT IPv4 connection

    [Tags]  Current

    BasicsApp.Navigate to Status Page
    Status.Verify if ONT IPv4 is connected

User must go to advanced and enable remote access and access it

    BasicsApp.Navigate to Advanced Page
    Advanced.Click remote management
    Advanced.Set Remote Management to enabled
    ${ipv4_WAN_addr} =  Advanced.Get WAN Ipv4 Address
    Advanced.Click Security Tab
    ${admin_username} =  Advanced.Get admin username
    ${admin_password} =  Advanced.Get admin password
    CommonLogin.EWI Logout
    BasicsApp.Close EWI
    BasicsApp.Open EWI    ${ipv4_WAN_addr}  ${DEFAULT_BROWSER}
    CommonLogin.EWI Login  ${admin_username}  ${admin_password}
    BasicsApp.Check if support tab does not exist