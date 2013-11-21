Feature: Ping

  Scenario: requesting ping
    When I request ping
    Then I receive pong
