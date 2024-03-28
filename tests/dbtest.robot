*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***
${DB_DRIVER}      pymysql
${DB_HOST}        sql11.freemysqlhosting.net
${DB_PORT}        3306
${DB_NAME}        sql11694699
${DB_USER}        sql11694699
${DB_PASSWORD}    JEnj8UNqJa

*** Test Cases ***
Connect to MySQL Database
    Connect To Database    dbapiModuleName=${DB_DRIVER}  dbName=${DB_NAME}    dbUsername=${DB_USER}    dbPassword=${DB_PASSWORD}    dbHost=${DB_HOST}    dbPort=${DB_PORT}
    @{result}=    Query    SELECT * FROM testusers
    Log Many    ${result}
    Disconnect From Database
