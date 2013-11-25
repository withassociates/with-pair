Feature: Booking a session

  Scenario:
    Given there is a session available today with Tom
    When I visit the site
    And I click "Book Session"
    And I fill in my contact details
    And I describe what I want to work on
    And I click "Book Session"
    Then I see "Tom will be in touch"
    And Tom gets an email notification of the booking
    And I get an email notification of the booking
