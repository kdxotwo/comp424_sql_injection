# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Rails version
6.1.1

* Ruby version
ruby-2.7.0

* Database
Mysql

* System dependencies

* Configuration
Use RVM to manage your ruby versions: https://rvm.io/rvm/install

* Database creation
To create your database, from your terminal go to the root directory of your project and run this command:

'rake db:create'

Then run migrations with 
'rake db:migrate'

* Data
    1. Register many users through the UI
    2. Populate the product table by either adding them manually through you mysql client or by running rails console. 
    
    If you want to do it through rails console, run this command from your terminal in the root directory of the application:
        'rails console'
    then create products with this command:
    'Product.create(:name => "something", :quantity => 5, :price => 15.50)'

* To test the sql injection

    1. Create an account through registration page
    2. Log in
    3. Insert any sql injections (time-based, tautology-based, union-based) inside the search input field
        1. s' or 1 = 1 -- 
        2. s' and 1 = SLEEP(20) -- 
        3. s' union(select username, password_hash, email from users) --  
    4. If the union sql injection is successful, you'll be able to view the username and password of all users including admins, then you'll be able to login as anyone.

    Note: There are two authentication implemented, a secure and insecure one. When pulling the changes, you'll be using the insecure authentication. You cannot try sql injection through login because of the authentication logic not using a single query such as "Select * where username = 'test' and password = '1234'"

* To secure
    You'll need to uncomment the blocks of codes marked as secure and comment out the ones marked as insecure


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
