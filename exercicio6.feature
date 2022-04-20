Feature: Encontrar usuários 
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Background: Configurção url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "search"

        #Criar usuário 
        * def createUser = call read("hook.feature@meusdogs")
        * def nameUser = createUser.response.name
        * def emailUser = createUser.response.email
       
    Scenario: Pesquisar usuário por nome
        And param value = nameUser
        When method get
        Then status 200
        And match response == "#array"
        And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
        And match response contains {id: "#(createUser.response.id)", name: "#(createUser.response.name)", email: "#(createUser.response.email)", createdAt: "#(createUser.response.createdAt)", updatedAt: "#(createUser.response.updatedAt)"}
        
        * def deletar = call read ("hook.feature@deletar")

        
    Scenario: Pesquisar usuário por email
        And param value = emailUser
        When method get
        Then status 200
        And match response == "#array"
        And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
        And match response contains {id: "#(createUser.response.id)", name: "#(createUser.response.name)", email: "#(createUser.response.email)", createdAt: "#(createUser.response.createdAt)", updatedAt: "#(createUser.response.updatedAt)"}
        * def deletar = call read ("hook.feature@deletar")
