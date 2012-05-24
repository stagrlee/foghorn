Feature: Compute Service

  Scenario: The compute service should start a new server
    Given the reference to the "m1.small" flavor is known
    And the reference to the "tty" image is known
    And the reference to the "demo" project is known
    When the compute service is invoked to start a new server
    Then a new server should be started
