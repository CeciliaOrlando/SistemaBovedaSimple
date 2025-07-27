// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract VaultBase {    
    using SafeMath for uint256;
    
    mapping(address => uint256) public balances;

    address public owner;
  
    event Deposit(address indexed user, uint256 amount, uint256 newBalance);

    event Withdrawal(address indexed user, uint256 amount, uint256 newBalance);

   
    constructor() {
        owner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion.");
        _;
    }

    function getBalance(address _user) public view returns (uint256) {
        return balances[_user];
    }
}


contract VaultManager is VaultBase {

      function deposit() public payable {
       
        require(msg.value > 0, "No se puede depositar 0 ETH.");

        balances[msg.sender] = balances[msg.sender] + (msg.value);

        
        emit Deposit(msg.sender, msg.value, balances[msg.sender]);
    }

  
    function withdraw(uint256 _amount) public {
        
        require(_amount > 0, "No se puede retirar 0 ETH.");

        
        require(balances[msg.sender] >= _amount, "Fondos insuficientes.");

       
        balances[msg.sender] = balances[msg.sender] - (_amount);

     
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Fallo al enviar ETH.");

       
        emit Withdrawal(msg.sender, _amount, balances[msg.sender]);
    }

    
    receive() external payable {
        deposit();
    }
}
