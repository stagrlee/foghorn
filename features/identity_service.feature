Feature: Authentication

  Background:
    Given the client is authenticated with user "admin" and password "klnm12"
    And the client is connected to the identity service

  Scenario: The identity service should return a non-empty list of users when queried.
    When the list of users is retrieved from the identity service
    Then the list of users should not be empty

  Scenario: The identity service should return a non-empty list of tenants when queried.
    When the list of tenants is retrieved from the identity service
    Then the list of tenants should not be empty

  Scenario: The identity service should return a non-empty list of roles when queried.
    When the list of roles is retrieved from the identity service
    Then the list of roles should not be empty