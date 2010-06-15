@simple
Feature: Be able to send a dynamically created Gruff graph out
    In order to have a useful piece of software
    As a developer
    I need to be able to send Gruff graphs out via Sinatra

  	Scenario Outline: Send out a simple gruff graph
    Given I am have loaded the simple.rb example
    When I visit /a_simple_<type>_chart.png
    Then I should get a 200 response
    And I should see a png graph 400x225 in size
    	Examples:
        	| type             |
	        | accumulator_bar  |
	        | area             |
	        | bar              |
	        | dot              |
	        | line             |
	        | pie              |
	        | side_stacked_bar |	
	        | stacked_area     |	 
	        | stacked_bar 	   |

