```solidity
function withdraw(uint amount) public {
  require(amount <= balanceOf[msg.sender], "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  payable(msg.sender).transfer(amount);
}
```

This code has a potential reentrancy bug.  If the `transfer` function calls back into the `withdraw` function before `balanceOf[msg.sender] -= amount;` completes, the caller could withdraw more funds than their balance.