Feature: Adding a session

  Scenario:
    Given I am in London
    Given it is 28 April 2014 at 12:00
    And I am signed in to Google as "calum@withassociates.com"
    When I visit "/admin"
    And I fill in "Add a session" with "Wednesday at 2pm"
    And I click "Add"
    Then I see "Wednesday 2:00–2:30pm"
