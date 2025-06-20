@REQ_HU-123 @deleteCharacterByID
Feature: Delete Character from Marvel API by ID

  @id:1 @updateCharacterByIDHappyPath
  Scenario: T-API-HU-123-CA1-Delete character by ID
    * def newRequest = { name: 'Spiderman', alterego: 'Petter Parker', description: 'Spider', powers: ['Hiper force'] }
    * def temp = {}
    * karate.set('temp', 'requestBody', newRequest)
    * def result = call read('./createCharacter.feature@createCharacterHappyPath') temp
    * def characterId = result.characterId
    * def characterResponse = result.characterResponse
    Given url baseUrl+'/'+characterId
    When method DELETE
    Then status 204

  @id:2 @getCharacterWithWrongId
  Scenario: T-API-HU-123-CA2-Delete character by ID but ID does not exist
    Given url baseUrl+'/999'
    When method DELETE
    Then status 404
    And match response == '#object'
    And match response.error == 'Character not found'


