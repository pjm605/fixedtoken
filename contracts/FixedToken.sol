pragma solidity ^0.4.13;

import "./ERC20TokenI.sol";
import "./Owned.sol";


contract FixedToken is ERC20TokenI, Owned
{

	// initial number of tokens
	uint public totalTokens = 1000000;


	// address to balance mapping
	mapping(address => uint) balances;

	function FixedToken()
	{
		balances[msg.sender] = totalTokens;
	}

	// ERC20TokenI functions
	function totalSupply()
		constant
		returns (uint totalSupply)
	{
		totalSupply = totalTokens;
	}

	function balanceOf(address _owner)
		constant
		returns (uint balance)
	{
		balance = balances[_owner];
	}

	function transfer(address _to, uint _value) returns (bool success);
	function transferFrom(address _from, address _to, uint _value) returns (bool success);
	function approve(address _spender, uint _value) returns (bool success);
	function allowance(address _owner, address _spender) constant returns (uint remaining);


}
