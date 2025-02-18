# Solidity Reentrancy Vulnerability

This repository demonstrates a reentrancy vulnerability in a Solidity smart contract's withdraw function and its solution.

## Vulnerability

The `withdraw` function in `bug.sol` is vulnerable to reentrancy attacks.  A malicious contract can call back into the `withdraw` function during the execution of the `transfer` function, potentially allowing the attacker to withdraw more funds than their actual balance.

## Solution

The `bugSolution.sol` file provides a corrected version of the `withdraw` function that mitigates the reentrancy vulnerability by using the Checks-Effects-Interactions pattern.  This pattern ensures that state changes happen only after all checks have passed.