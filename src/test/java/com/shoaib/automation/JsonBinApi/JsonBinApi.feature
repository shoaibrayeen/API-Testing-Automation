Feature: Test JSON Bin API - GET

  Background:
    * url JSONBINAPI_IP
    * def constants = read('classpath:endpoints.js')
    * def api_response = read('classpath:response/getApi/response.json')

  Scenario Outline: Testing of GET API
    Given path constants['FETCH_DETAILS']
    And header Content-Type = 'application/json'
    And header secret-key = '<SECRET_KEY>'
    When method get
    Then status 200
    And match response == api_response
    Examples:
      |                        SECRET_KEY                            |
      | $2b$10$a5pPzFpI0FUDLGbUCBwc4./npTSp.U2nrULweVf8DJ28HCZWhqlse |

