Feature: Test User API

  Background:
    * url 'http://172.23.19.54:30004/openapi/moneytransfer/v1'

  Scenario Outline: Testing of Credit and Refund APIs
    Given path '/credit'
    And header Content-Type = 'application/json'
    And request { amount: <amount>, channelName: '<channelName>', country: '<country>', currency: '<currency>', extTRID: <extTRID>, msisdn: '<msisdn>', mtcn: <mtcn>, payerCountry: '<payerCountry>', payerFirstName: '<payerFirstName>', payerLastName: '<payerLastName>' }
    When method post
    Then status 200
    And match response == { txnID: '#notnull', status: '200', message: '#notnull' }
    
    * def tid = response.txnID
	Given path '/refund'
	And header Content-Type = 'application/json'
    And request { channelName: '<channelName>', country: '<country>', txnID: '#(tid)' }
    When method post
    Then status 200
    And match response == { txnID: '#(tid)', status: '200', message: 'Success' }
    Examples:
	    | amount | channelName | country | currency | extTRID 	  | msisdn    | mtcn | payerCountry | payerFirstName | payerLastName |
	    | 100	 | THUNESIMT   | KENYA   | KES		| 51244189194 | 781871006 | 52 	 | Uganda		| Thunes Ousmane | 		Test 	 |
	    | 100	 | THUNESIMT   | KENYA   | KES		| 51244189174 | 781871006 | 52 	 | Uganda		| Thunes Ousmane | 		Test 	 |
	    | 100	 | THUNESIMT   | KENYA   | KES		| 51244189184 | 781871006 | 52 	 | Uganda		| Thunes Ousmane | 		Test 	 |
	    | 100	 | THUNESIMT   | KENYA   | KES		| 51244189164 | 781871006 | 52 	 | Uganda		| Thunes Ousmane | 		Test 	 |