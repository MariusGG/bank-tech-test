# Bank Tech Test

[![Build Status](https://travis-ci.com/DaveLawes/bank-tech-test.svg?branch=master)](https://travis-ci.com/DaveLawes/bank-tech-test)

This is a Ruby solution to the bank tech test, described in the following repo:
https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md

It's a simple Ruby app that allows a client (via a REPL) to make deposits, withdrawals and see their account statement.

*Tags: RSpec, Ruby, BDD, SOLID*

## The App

### Install

Make sure you have Ruby 2.5.1 on your machine, the app requires this version.

Clone this repo to your local machine and run `bundle install`; all application dependencies will be installed.

### Test

To run the tests run `rspec` from the root of the project directory. This will execute all tests in the suite and show the test coverage too. Note that I've been using Travis CI as part of this project to ensure I understand when commits break the build.

To check the linter run `rubocop`.

### Use

To use the app open your favourite Ruby REPL, I've been using IRB. 

- `require './lib/client'` to load Client class and all other dependent classes
- `client = Client.new` to instantiate a new Client object
- `client.deposit(500)` to deposit £500
- `client.withdraw(250)` to withdraw £250
- `client.account_statement` to get a pretty print of your account statement

NB: if you try to withdraw more money than you have in your account, you will see an error `Insufficient funds`.

A typical series of commands will yield the following:

<img src = >



## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## User Stories

Given the specification above I created the following user stories:

```
As a banking client
So I can save money
I would lke to make a deposit

As a banking client
So I can use the money I've saved
I would like to make a withdrawal

As a banking client
So I can track my balance
I would like to see my bank statement
```

Including an edge case for withdrawal:


```
As a bank
So I don't lend money unintentionally
I want to prevent clients from withdrawing more than their balance

```
Including extra features to improve user experience:

```
As a banking client
So it is easier for me to deposit and withdraw money
I want the app to determine the date of my transaction

As a bank
To allow only legal tender
I want the app to only accept deposits or withdrawals to 2 decimal places
```


## Domain Model

The following domain model represents the classes and structure of my application.

I have three classes:

1. Client: responsible for taking inputs from the user and providing outputs to the user
2. Transaction: responsible for saving a 'snapshot' of the client's transaction history
3. TransactionPrinter: responsible for creating a formatted string for the account statement

```
    User
╔════════════╗  
║            ║ Interacts with application
║  Terminal  ║ via REPL, e.g. IRB     
║            ║
╚════════════╝
      |
      |
      |                                   
╔════════════╗     
║            ║  - Maintains the current balance     
║   Client   ║  - Maintains an array of Transaction objects
║  (class)   ║  - Instantiates objects and invokes methods on them    
╚════════════╝      
       |                           ╔════════════╗
       |                           ║            ║ - Generates a formatted date        
       |-------------------------->║Transaction ║ - Holds the state of the transaction
       |                           ║  (class)   ║ 
       |                           ╚════════════╝  
       |                             
       |                           ╔════════════╗ 
       |                           ║            ║ - Has no state
       |-------------------------->║   Printer  ║ - Formats the transaction history as a pretty string
                                   ║  (module)  ║
                                   ╚════════════╝            
                                            
```

## Approach

For this app I chose to code in Ruby. The primary reason for choosing the language was that, due to experience, I was confident the specification could be delivered. The secondary reason was that I am comfortable working with Ruby, which allowed me to dedicate just as much thought to my process and methodology as I was to my coding.

To highlight my approach to solving this problem:

* Read and understand the specification (this helped me to choose my language and associated testing framework)
* Translate the specification into key user stories, as well as those that cover edge cases
* Start by :
	1. creating a feature test for the first story. This defined how I intended my user to interact with the application in the REPL.
	2. creating an associated unit test for the related class(es), ensuring all my unit tests are isolated.
	3. watch my tests fail and ensure they are failing in the way I expect!
	4. write code to make the test pass, or at least change the error until I get to green!
	5. commit with a semantic message and add a comment if I feel it is necessary.
	6. refactor, ensure my tests all pass, then commmit again.
* Repeat steps 1-6 until all my feature tests pass.


## Areas of Improvement

- Things that could be improved
- Add edge case for number input? What happens if float etc




