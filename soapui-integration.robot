*** Settings ***
Library    OperatingSystem

*** Variables ***
${SoapUI_suite}    TestSuite-1
${Test_Case}    TestCase-1
${SoapUI_Project}    C:/workspace/soapui-projects/calculator-soapui-project.xml
${test_runner}    C:/"Program Files"/SmartBear/SoapUI-5.5.0/bin/testrunner.bat
${output_file}    C:/test/Response.xml

*** Test Cases ***
SoapUi run testsuite
    SoapUI Test Runner    ${test_runner}    ${SoapUI_Project}    ${SoapUI_suite}    ${Test_Case}    ${output_file}

*** Keywords ***
SoapUI Test Runner
    [Arguments]    ${test_runner}    ${SoapUI_Project}    ${SoapUI_suite}    ${Test_Case}    ${output_path}
    ${cmd_out}=  Run    ${test_runner} -c ${Test_Case} ${SoapUI_Project}
    File Should Exist    ${output_file}
