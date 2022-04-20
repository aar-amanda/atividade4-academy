@ignore
Feature: Hook
    @meusdogs
    Scenario: Não sei o que escrever
        * def jujuba = "Pacoca" + Date.now()
        * def theo = Date.now() + "@qualquer.com"
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "users"
        And request {name: "#(jujuba)", email: "#(theo)"}
        When method post 

    