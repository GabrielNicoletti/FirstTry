*** Settings ***
Library  Selenium2Library


*** Keywords ***

Click Internet tab
    click link  css=#status_internetstatus_ipv6 > a
    sleep   3s

Click Connection tab
    click link  css=#status_connection > a
    sleep   3s

Click Devices tab
    click link  css=#status_devicetable > a
    sleep   3s

Click Ethernet tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[4]/a
    sleep  3s

Click Wireless tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[5]/a
    sleep  3s

Click NAT tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[6]/a
    sleep  3s

Click Routing tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[7]/a
    sleep  3s

Click Security tab
    click link  xpath=//*[@id="content-left"]/div/nav/ul/li[8]/a
    sleep  3s


Verify if ONT IPv4 is connected
    table cell should contain  xpath=//*[@id="conn_tab"]  3  2  Connected

Verify IPv4 Address
    get table cell  xpath=//*[@id="gateway_tab"]  9  2
