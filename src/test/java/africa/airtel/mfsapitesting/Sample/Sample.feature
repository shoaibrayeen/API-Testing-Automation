Feature: Test User API

  Background:
    * url 'localhost:8000'

  Scenario Outline: Testing of Credit and Refund APIs
    Given path '/credit'
    And header Content-Type = 'application/json'
    And request { amount: <amount>, channelName: '<channelName>', country: '<country>', currency: '<currency>', extTRID: <extTRID>, msisdn: '<msisdn>', mtcn: <mtcn>, payerCountry: '<payerCountry>', payerFirstName: '<payerFirstName>', payerLastName: '<payerLastName>' }
    When method post
    Then status 200
    And match response == { txnID: '#notnull', status: '<expectedStatusCode>', message: '#notnull' }
    
    * def tid = response.txnID
    Given path '/refund'
    And header Content-Type = 'application/json'
    And request { channelName: '<channelName>', country: '<country>', txnID: '#(tid)' }
    When method post
    Then status 200
    And match response == { txnID: '#(tid)', status: '<expectedStatusCode>', message: 'Success' }
    Examples:
        | amount | channelName | country | currency | extTRID     | msisdn    | mtcn | payerCountry | payerFirstName | payerLastName | expectedStatusCode |
        | 100    | THUNESIMT   | KENYA   | KES      | 51244189496 | 781871006 | 52   | Uganda       | Thunes Ousmane |      Test     |      200           |
        | 100    | THUNESIMT   | KENYA   | KES      | 51244189476 | 781871006 | 52   | Uganda       | Thunes Ousmane |      Test     |      200           |
        | 100    | THUNESIMT   | KENYA   | KES      | 51244189586 | 781871006 | 52   | Uganda       | Thunes Ousmane |      Test     |      200           |
        | 100    | THUNESIMT   | KENYA   | KES      | 51244189466 | 781871006 | 52   | Uganda       | Thunes Ousmane |      Test     |      200           |
