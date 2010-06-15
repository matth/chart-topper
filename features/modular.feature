@modular
Feature: Be able to use the extension in a modular app
    In order to have a useful piece of software
    As a developer
    I need to be able to send Gruff graphs out via Sinatra

  	Scenario Outline: Send out a simple gruff graph
    Given I am have loaded the modular app 
    When I visit /my_<type>_chart.png
    Then I should get a 200 response
    And I should see a png graph 400x225 in size
    	Examples:
        	| type |
	        | bar  |
	        | pie  |

