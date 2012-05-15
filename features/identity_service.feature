Feature: Identity Service

  Scenario: The identity service should return a non-empty list of users when queried.
    When the list of users is retrieved from the identity service
    Then the list of users should not be empty

  Scenario: The identity service should return a non-empty list of tenants when queried.
    When the list of tenants is retrieved from the identity service
    Then the list of tenants should not be empty

  Scenario: The identity service should return a non-empty list of roles when queried.
    When the list of roles is retrieved from the identity service
    Then the list of roles should not be empty