Feature: Remover usuários 
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas
    
    Background: Configuração url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"

    Scenario: Remover usuário com sucesso 
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id
        When method delete
        Then status 204

    Scenario: Remover usuário com sucesso mesmo com identificador inexistente
        And path java.util.UUID.randomUUID()  
        When method delete
        Then status 204

