```solidity
function withdraw(uint amount) public {
  require(amount <= balanceOf[msg.sender], "Insufficient balance");
  uint balanceBefore = balanceOf[msg.sender];
  balanceOf[msg.sender] -= amount;
  require(balanceOf[msg.sender] == balanceBefore - amount, "Balance calculation failed");
  payable(msg.sender).transfer(amount);
}
```
This solution adds a check after subtracting the amount from the balance to ensure the balance calculation was successful before transferring the funds.  This prevents reentrancy attacks by ensuring that state updates happen only after all checks are complete.