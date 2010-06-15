@options
Feature: Be able to set some options by default
    In order to have a useful piece of software
    As a developer
    I need to be able to set various options for my graphs

  	Scenario: Set a prefix for all URLs
    Given I am have loaded the options.rb example
    When I visit /my/prefix/my_graph.png
    Then I should get a 200 response
    And I should see a png graph 400x225 in size
