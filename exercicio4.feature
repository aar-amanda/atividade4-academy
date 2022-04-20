Feature: Atualizar usuários 
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas
    
    Background: Configuração url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        * def payloadUpdate = { name: "Amanda desesperada", email: "#(Date.now() + '@qualquer.com')"}
    

    Scenario: Atualizar usuário com sucesso 
        * def chocolate = call read("hook.feature@meusdogs")
        Given path chocolate.response.id
        And request payloadUpdate
        When method put
        Then status 200
        And match response contains {id: "#(response.id)", name: "#(response.name)", email: "#(response.email)", createdAt: "#(response.createdAt)", updatedAt: "#(response.updatedAt)"}
        
    Scenario: Não deve ser possível atualizar usuário com identificador inexistente
        Given path java.util.UUID.randomUUID()
        And request payloadUpdate
        When method put
        Then status 404

    Scenario: Não deve ser possível atualizar usuário sem nome e email
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id       
        And request { nome: "", email: "" }
        When method put
        Then status 400

    Scenario: Não deve ser possível atualizar usuário sem nome
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id
        And request { nome: "", email: "#(Date.now() + '@qualquer.com')" }
        When method put
        Then status 400

    Scenario: Não deve ser possível atualizar usuário sem email
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id 
        And request { name: "jujuba", email: "" }
        When method put
        Then status 400

    Scenario: Não deve ser possível atualizar usuário com email inválido
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id  
        And request { name: "jujuba", email: "aar.amandagmail.com" }
        When method put
        Then status 400

    Scenario: Não deve ser possível atualizar usuário com email inválido
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id  
        And request { name: "jujuba", email: "aar.amandagmail@" }
        When method put
        Then status 400
        
    Scenario: Não deve ser possível atualizar usuário com email já utilizado
        * def chocolate = call read("hook.feature@meusdogs")
        * def chocolate2 = call read("hook.feature@meusdogs")
        And path chocolate.response.id
        And request {name: "Amanda", email:"#(chocolate2.response.email)"}
        When method put
        Then status 422
        And match response contains { error: "E-mail already in use." }
       
    Scenario: Não deve ser possível atualizar usuário com nome com mais de 100 caracteres 
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id  
        And request { name: "Tinhaumapedranomeiodocaminhonomeiodocaminhotinhaumapedraeeucaidemotonessapedraenaoficoutudobempedramaldita", email: "#(Date.now() + '@qualquer.com')"}
        When method put
        Then status 400

    Scenario: Não deve ser possível atualizar usuário com email com mais de 60 caracteres
        * def chocolate = call read("hook.feature@meusdogs")
        And path chocolate.response.id  
        And request { name: "Amanda", email: "afestacaboualuzapagouopovosumiuanoiteesfrioueagorajoseeagoravocevocequeésemnomequezombadosoutros@example.com"}
        When method put
        Then status 400