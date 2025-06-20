@REQ_HU-123 @createCharacter
Feature: Create Character from Marvel API

  Background:
    * def requestDefault = read('classpath:../features/marvel_api/createCharacterRequest.json')
    * def requestBody = karate.get('requestBody', requestDefault)
    * def whitoutRequiredFieldsResponse = read('classpath:../features/marvel_api/createCharacterWithoutRequiredFieldsResponse.json')

    Given url baseUrl
      And request requestBody
  @id:1 @createCharacterHappyPath
  Scenario: T-API-HU-123-CA1-Create a new character
    When method POST
    Then status 201
      And match response == '#object'
      And match response == { id: '#number', name: '#string', alterego: '#string', description: '#string', powers: '#array' }
    * def characterId = response.id
    * def characterResponse = response

  @id:2 @createCharacterCharacterAlreadyExists
  Scenario: T-API-HU-123-CA2-Create a new character but character already exists
    When method POST
    Then status 400
      And match response == '#object'
      And match response.error == 'Character name already exists'

  @id:3 @createCharacterWithoutRequiredFields
  Scenario: T-API-HU-123-CA3-Create a new character but does not provide required fields
    * set requestBody.name = ''
    * set requestBody.alterego = ''
    * set requestBody.description = ''
    * set requestBody.powers = []
    When method POST
    Then status 400
    And match response == '#object'
    And match response == whitoutRequiredFieldsResponse


