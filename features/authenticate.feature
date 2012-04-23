Feature: Authentication

  Background:
    Given the username is "admin"
    And the password is "klnm12"

  Scenario: successful authentication
    When the client authenticates
    Then compute service should be in the catalog
    And identity service should be in the catalog
    And image service should be in the catalog
    And volume service should be in the catalog
    
