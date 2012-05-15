Feature: Image Service

  Background:
    Given the client is connected to the image service

  Scenario: The image service should return a non-empty list of public images when queried.
    When the list of public images is retrieved from the image service
    Then the list of public images should not be empty
