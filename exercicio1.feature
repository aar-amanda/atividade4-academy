Feature: Listar usuários
    Como uma pessoa qualquer
    Desejo vizualizar a lista de usuários cadastrados
    Para ter as informações sobre todos os usuários

    Background: Base url
        Given url "https://crud-api-academy.herokuapp.com/api-docs/"
        And path "users"

    # 1_Cenário de teste de listar usuário 
        Scenario: Listar todos os usuários cadastrados
            When method get
            Then status 200
            And match response == "#array"
            And match each response contains read ('responseFormat.json')
