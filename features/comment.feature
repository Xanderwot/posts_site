Feature: Article features
	
	@javascript
	Scenario: Create comment as comentator
		Given the user "comentator" has an account
    And article "title" with content "He want comment me" is exist
    When I login in as "comentator"
    And I add comment contains "My first comment" to article
    Then I should see "My first comment"

  @javascript
  Scenario: Create comment as newsmaker
		Given the user "newsmaker" has an account
    And article "title" with content "He want comment me" is exist
    When I login in as "newsmaker"
    And I add comment contains "My second comment" to article
    Then I should see "My second comment"  

  @javascript
  Scenario: Create comment as admin
		Given the user "admin" has an account
    And article "title" with content "He want comment me" is exist
    When I login in as "admin"
    And I add comment contains "My last comment" to article
    Then I should see "My last comment"
    
  @javascript
  Scenario: Delete comment as admin
  	Given the user "admin" has an account
    And article "title" with content "He want comment me" is exist
    And comment with content "delete me!" is exist
    When I login in as "admin"
    And I delete comment
    Then I should see "No comments et"