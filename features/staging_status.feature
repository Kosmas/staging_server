Feature: See staging server status
  Scenario: See current staging server status
    Given there is staging server named "server!" with status "available"
    When I go to the status page
    Then I should see "server 1 - available"
