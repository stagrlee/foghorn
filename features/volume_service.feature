@volume
Feature: Volume Service

  Scenario: the volume service should create a new 1GB volume
    Given a 1GB volume named "FogHornVolume" is created
    Then the volume should become available
    And the list of volumes should contain the new volume
    When the details for the volume are retrieved
    Then the size of the retrieved volume should be a 1GB
