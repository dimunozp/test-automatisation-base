@REQ_HU-123 @updateCharacterByID
Feature: Update Character from Marvel API by ID

  Background:
    * def requestDefault = read('classpath:../features/marvel_api/createCharacterRequest.json')

  @id:1 @updateCharacterByIDHappyPath
  Scenario: T-API-HU-123-CA1-Update character by ID
    * def newRequest = { name: 'Spiderman', alterego: 'Petter Parker', description: 'Spider', powers: ['Hiper force'] }
    * def temp = {}
    * karate.set('temp', 'requestBody', newRequest)
    * def result = call read('./createCharacter.feature@createCharacterHappyPath') temp
    * def characterId = result.characterId
    * def characterResponse = result.characterResponse
    Given url baseUrl+'/'+characterId
    And request requestDefault
    When method PUT
    Then status 200
    And match response == '#object'
    And match response == { id: '#number', name: '#string', alterego: '#string', description: '#string', powers: '#array' }

  @id:2 @getCharacterWithWrongId
  Scenario: T-API-HU-123-CA2-Update character by ID but ID does not exist
    Given url baseUrl+'/999'
    And request requestDefault
    When method PUT
    Then status 404
    And match response == '#object'
    And match response.error == 'Character not found'


