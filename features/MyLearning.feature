Feature: I teach myself MAF

Scenario: perform simple GET request #1
    Given url "https://reqres.in/"
    And api "api/users/2"
    When method get
    Then the status is ok
    And item "response.data.first_name" is equal to "Janet"

Scenario: perform simple GET request #2
    When perform api request: 
    """
        {
            "url" : "https://reqres.in/api/users/2",
            "method": "GET"
        }
    """
    Then the status is ok
    And item "response.data.first_name" is equal to "Janet"

Scenario Outline: Scenario Outline name: perform simple GET request with data table
    Given url "https://reqres.in/"
    And api "<API>"
    When method get
    Then the status is ok
    And item "response.data.first_name" is equal to "<VALUE>"

Examples:
    |API|VALUE|
    |api/users/2|Janet  |
    |api/users/7|Michael|
    |api/users/12|Rachel|

Scenario: perfom request and save data for the second request
    Given url "https://reqres.in/"
    And api "/api/users?page=2"
    When method get
    Then the status is ok
    And set "userID" to item "response.data[3].id"
    When api "/api/users/${userID}"
    And method get
    Then item "response.data.first_name" is equal to "Byron"