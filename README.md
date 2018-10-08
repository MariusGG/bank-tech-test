# bank-tech-test

[![Build Status](https://travis-ci.com/DaveLawes/bank-tech-test.svg?branch=master)](https://travis-ci.com/DaveLawes/bank-tech-test)

This is a Ruby solution to the problem described in the following repo:
https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md


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
Including an extra feature to improve user experience:

```
As a banking client
So it is easier for me to deposit and withdraw money
I want the app to determine the date of my transaction
```


## Domain Model

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
║  (class)   ║  - Instantiate objects and invokes methods on them    
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
- Why choose Ruby
- Process and methodology
- Things that could be improved
- Add edge case for number input? What happens if float etc




