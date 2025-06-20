@REQ_HU-123 @getCharacters
Feature: Get Characters from Marvel API

  Background:
    Given url baseUrl

  @id:1 @getCharactersHappyPath
  Scenario: T-API-HU-123-CA1-Get all characters
    When method GET
    Then status 200
      And match response == '#array'

  @id:2 @getCharactersWrongUrl
  Scenario: T-API-HU-123-CA1-Get all characters
    * url baseUrl+'wrongUrl'
    When method GET
    Then status 500
    And match response.error == 'Internal server error'
