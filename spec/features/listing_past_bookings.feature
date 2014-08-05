Feature: Listing past bookings
  As a member of the With Associates team
  I want to be able to see all past bookings
  So that I can write some cool case studies about them

  Scenario: Listing past bookings
    Given I am signed in
    And there have been some bookings
    When I visit "/admin/history"
    Then I see a list of past bookings
