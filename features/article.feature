Feature: Article features
  
  @javascript
  Scenario: Create new article as admin
    Given the user "admin" has an account
    When I login in as "admin"
    And I create article with title "title" and content "Body of my new article"
    Then I should see "Body of my new article"

  @javascript  
  Scenario: Create new article as newsmaker
    Given the user "newsmaker" has an account
    When I login in as "newsmaker"
    And I create article with title "title" and content "Body of my new article"
    Then I should see "Body of my new article"

  @javascript  
  Scenario: Edit article as admin
    Given the user "admin" has an account
    And article "title" with content "Body of created article" is exist
    When I login in as "admin"
    And I edit article with new title "Edited title" and content "Changed content"
    Then I should see "Changed content"

  @javascript
  Scenario: Delete article as admin
    Given the user "admin" has an account
    And article "Article" with content "He want to destroy me!" is exist
    When I login in as "admin"
    And  I delete existed article
    Then I shoul not see any articles
