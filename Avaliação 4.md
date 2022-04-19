![Logo Raro Academy](./logo.jpeg)

# Atividade 4

O objetivo desta atividade é avaliar seus conhecimentos sobre testes automatizados de API com o Karate Framework

Leia a especificação e Swagger abaixo e, em seguida, siga as orientações para a entrega da atividade.

## Enunciando

Leia a especificação e Swagger abaixo e, em seguida, siga as orientações para a entrega da atividade.

- [Especificação C.R.U.D API](./Especifica%C3%A7%C3%A3o%20CRUD%20api.md)

- [Swagger C.R.U.D API](https://crud-api-academy.herokuapp.com/api-docs/)


1. Configuração do projeto:
    1. Crie um repositório no Github com o nome ``atividade4-academy``;
    2. Clone este repositório para seu computador pessoal;
    3. Configure o ``karate.jar`` neste repositório;
    4. Crie o arquivo ``.gitignore`` e configure-o para ignorar a pasta ``taget`` que é criada automaticamente pelo Karate Framework, já que não precisamos *versionar* esta pasta.

2. Utilizando o Karate Framework, implemente os testes do recurso ``Users``, conforme descrito abaixo.
    1. Crie cenários de teste que validem se a *user story* ``Listar usuário`` foi implementada corretamente.  Seus testes devem validar o ``response code`` e ``response body``;
    2. Crie cenários de teste que validem se a *user story* ``Criar usuário`` foi implementada corretamente. Seus testes devem validar o ``response code`` e ``response body``, quando este existir;
    3. Crie cenários de teste que validem se a *user story* ``Encontrar um usuário`` foi implementada corretamente. Seus testes devem validar o ``response code`` e ``response body``, quando este existir;
    4. Crie cenários de teste que validem se a *user story* ``Atualizar usuário`` foi implementada corretamente.  Seus testes devem validar o ``response code`` e ``response body``, quando este existir;
    5. Crie cenários de teste que validem se a *user story* ``Remover um usuário`` foi implementada corretamente.  Seus testes devem validar o ``response code`` retornado pela API;
    6. Crie cenários de teste que validem se a *user story* ``Pesquisar usuário`` foi implementada corretamente.  Seus testes devem validar o ``response code`` retornado pela API.
    
3. Atualize o repositório com as atividades feitas no item 2.
    
## Entrega

📌 Importante 📌

Você deve postar o link do repositório criado no item 1 no quadro do ClassRoom. 

Caso o repositório registre uma atualização de conteúdo após a data de final de entrega do exercício, isto poderá acarretar na perca de pontos no critério de entrega fora do prazo.