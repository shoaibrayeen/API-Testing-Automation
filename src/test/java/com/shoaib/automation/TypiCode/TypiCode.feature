Feature: Test TypiCode API - POST

  Background:
    * url TYPICODE_IP
    * def constants = read('classpath:endpoints.js')
    * def api_response = read('classpath:response/postApi/response.json')
    * def api_request = read('classpath:request/postApi/request.json')

  Scenario: Testing of POST API
    Given path constants['CREATE_NEW_USER']
    And header Content-Type = 'application/json'
    And request api_request
    When method post
    Then status 201
    And match response == api_response

