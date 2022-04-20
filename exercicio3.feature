Feature: Encontrar usuários 
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Background: Configuração url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"

    Scenario: Encontrar usuário com ID
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id
        When method get
        Then status 200
        And match response contains {id: "#(chocolate.response.id)", name: "#(chocolate.response.name)", email: "#(chocolate.response.email)", createdAt: "#string", updatedAt: "#string"}

    Scenario: Não localizar o usuário por ID inexistente          
        And path java.util.UUID.randomUUID()             
        Then method get             
        Then status 404 