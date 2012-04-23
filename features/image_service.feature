Feature: Image Service

  Background:
    Given the username is "admin"
    And the password is "klnm12"
    And the user is authenticated

  Scenario: listing images
    When a list of images is requested
    Then the response should have a list of images
