@REQ_HU-123 @getCharacterByID
Feature: Get Character from Marvel API by ID

  @id:1 @getCharacterByIDHappyPath
  Scenario: T-API-HU-123-CA1-Get character by ID
    * def newRequest = { name: 'Thor', alterego: 'Thunder God', description: 'God of Thunder', powers: ['Lightning', 'Storm Control'] }
    * def temp = {}
    * karate.set('temp', 'requestBody', newRequest)
    * def result = call read('./createCharacter.feature@createCharacterHappyPath') temp
    * def characterId = result.characterId
    * def characterResponse = result.characterResponse
    Given url baseUrl+'/'+characterId
    When method GET
    Then status 200
      And match response == '#object'
      And match response == characterResponse

  @id:2 @getCharacterWithWrongId
  Scenario: T-API-HU-123-CA2-Get character by ID but ID does not exist
    Given url baseUrl+'/999'
    When method GET
    Then status 404
    And match response == '#object'
    And match response.error == 'Character not found'


