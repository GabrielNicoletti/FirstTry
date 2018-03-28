*** Settings ***
Library  Selenium2Library


*** Variables ***

*** Keywords ***

Click Security tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[5]/a
    sleep   3s
Mouse over security tab
    #mouse over  xpath=//*[@id="content-left"]/div/nav/ul/li[5]/a
    mouse over  css=a[ui-sref='advancedSecurityAdmin']
    sleep   3s
Click admin credentials
    #Click link  xpath=html/body/div[1]/div[2]/div/div[1]/div/div/nav/ul/li[5]/ul/li[1]/a
    Click link  a ui-sref="advancedSecurityAdmin"
    sleep   3s

Set credentials to not required
    select radio button  admin_state   0
    sleep   3s

Click credentials apply button
    click button  id=apply_btn
    sleep   3s

Set credentials to required
    select radio button  admin_state   1
    sleep   3s

Click remote management
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[6]/a
    sleep   3s

Set Remote Management to enabled
    select radio button  remote_gui_state  1
    sleep   3s
    click button  id=apply_btn
    sleep   3s

Get admin username
    ${admin_username} =  get value  id=admin_username_field
    [Return]  ${admin_username}

Get admin password
    select checkbox  id=show_admin_password_checkbox
    ${admin_password} =  get value  id=admin_password_text_field
    [Return]  ${admin_password}

Get WAN Ipv4 Address
    ${wan_ipv4_address} =  get text  id=ipv4_url
    [Return]  ${wan_ipv4_address}


