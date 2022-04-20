Feature: Listar usuários
    Como uma pessoa qualquer
    Desejo vizualizar a lista de usuários cadastrados
    Para ter as informações sobre todos os usuários

    Scenario: Listar todos os usuários cadastrados
        * def chocolate = call read("hook.feature@meusdogs")
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}