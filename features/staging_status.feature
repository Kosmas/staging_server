Feature: See staging server status
  Scenario: See current staging server status
    Given there is a staging server named "server 1" with status "available"
    When I go to the status page
    Then I should see "server 1 - available"
  
  Scenario: Change status from available to pending testing
    Given there is a staging server named "Server 2" with status "available"
    When I change to pending testing with "Issue 1" and "John"
    Then I should see "Server 2 - Pending Testing"
    And I should see "Issue 1"
    And I should see "John"

  Scenario: Change status from pending testing to testing
    Given there is a staging server named "Server 3" with status "Pending Testing"
    When I change to testing with tester "Tester One" and testing started at "2014-10-29 10:00:00"
    Then I should see "Server 3 - Testing"
    And I should see "Tester One"
    And I should see "2014-10-29 10:00:00"

  Scenario: Change status from testing to accepted
    Given there is a staging server named "Server 4" with status "Testing"
    When I change to approved
    Then I should see "Server 4 - Approved"
    And I should see the current time

  Scenario: Change status from accepted to available
    Given there is a staging server named "Server 5" with status "Approved"
    When I change to available
    Then I should see "Server 5 - Available"
    And I should see all other fields empty
