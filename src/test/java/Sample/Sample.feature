Feature: Test User API

  Background:
    * url 'localhost:8000'

  Scenario Outline: Testing of Credit and Refund APIs
    Given path '/credit'
    And header Content-Type = 'application/json'
    And request { amount: <amount>, country: '<country>', currency: '<currency>' }
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
        | amount | country | currency | expectedStatusCode |
        | 100    | KENYA   | KES      |      200           |
        | 100    | KENYA   | KES      |      200           |
        | 100    | KENYA   | KES      |      200           |
        | 100    | KENYA   | KES      |      200           |
