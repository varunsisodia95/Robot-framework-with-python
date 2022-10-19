"""
This file contains the necessary locators
to be used to perform automation of bank operations
using robot framework
"""

"""
Locators for Bank manager operations
"""
BM_login_btn = "xpath://button[@ng-click='manager()']"
BM_addCx_tab = "xpath://button[contains(text(), 'Add Customer')]"
BM_openAcc_tab = "xpath://button[contains(text(), 'Open Account')]"
BM_CxList_tab = "xpath://button[contains(text(), 'Customers')]"
Home_btn = "xpath://button[text()='Home']"

BM_addCx_tab_fName = "xpath://input[@placeholder='First Name']"
BM_addCx_tab_lName = "xpath://input[@placeholder='Last Name']"
BM_addCx_tab_postCode = "xpath://input[@placeholder='Post Code']"
BM_addCx_tab_btn = "xpath://button[text()='Add Customer']"

BM_openAcc_tab_CxDropDownName = "userSelect"
BM_openAcc_tab_currencyListName = "currency"
BM_openAcc_tab_process_Btn = "xpath://button[text()='Process']"

BM_CxList_tab_searchBox = "xpath://input[@placeholder='Search Customer']"
BM_CxList_tab_CxTable = "xpath://table[@class='table table-bordered table-striped']"
BM_CXList_CxCount = "xpath://table[@class='table table-bordered table-striped']/tbody/tr"





















