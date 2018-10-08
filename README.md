# bank-tech-test

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
Including edge cases:

```
As a bank
So we don't lend money unintentionally
I want to prevent clients from withdrawing more than their balance
```
