Feature: Criar novo usuário
    Como uma pessoa qualquer
    Desejo registar informações de usuário
    Para poder manipular estas informações livremente

    Background: Base url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        * def userName = "Amanda Rodrigues"
        * def userNameUpdate = "Amanda Rodrigues"
        * def payload = {name: "Amanda Rodrigues", email: "aar.amanda@gmail.com"}
        
    Scenario: Criar usuário com sucesso
        * def theo = Date.now() + "@qualquer.com"
        And request { name: "brincos", email: "#(theo)"}
        When method post 
        Then status 201
        And match response contains { name: "brincos", email: "#(response.email)"}
        

    Scenario: Criar usuário sem email não deve ser possível
        And request { }
        When method post
        Then status 400

    Scenario: Não deve ser possível criar usuário sem nome
        And request { email: "#payload.nome" }
        When method post
        Then status 400
    
    Scenario: Não deve ser possível criar usuário sem email
        And request { email: "#(payload.email)" }
        When method post
        Then status 400

    Scenario: Não deve ser possível criar usuário com email inválido
        And request { name: "Amanda Rodrigues", email: "aar.amandaemail.com" }
        When method post
        Then status 400 

    Scenario: Não deve ser possível criar usuário com email já utilizado   
        And request {name: "Amanda", email:"aar.amanda@email.com"}
        When method post
        Then status 422
        And match response == { error: "User already exists." }

    Scenario: Não deve ser possível criar nome com mais de 100 caracteres
        And request { name: "batatinhaquandonasceesparramapelochaoesobreissoenaoestatudobemvamosseguindopqavidaecomoeatristerealidadedapessoaquevivecomenxaqueca", email: "abcde@email.com"}
        When method post
        Then status 400

    Scenario: Não deve ser possível criar email com mais de 60 caracteres
        And request { name: "Amanda", email: "socorrodeusserounaosereisaquestaoeuamoaterceiraleidenewtontudoquevemvolta@email.com"}
        When method post
        Then status 400