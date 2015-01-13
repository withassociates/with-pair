Feature: Booking a session

  Scenario:
    Given there is a session available today with Tom
    When I visit the site
    And I click "Book Session"
    And I fill in my contact details
    And I fill in the hidden field
    And I describe what I want to work on
    And I click "Book Session"
    Then I receive a 422 response code
    And no booking is saved
