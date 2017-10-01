pragma solidity ^0.4.13;

import "./ERC20TokenI.sol";
import "./Owned.sol";


contract FixedToken is ERC20TokenI, Owned
{
	// symbol and name
	string public constant symbol = "FixedToken";
	string public constant name = "Fixed Token Example";

	// initial number of tokens
	uint public totalTokens = 1000000;

	// address to balance mapping
	mapping(address => uint) balances;

	// allow others to transfer from another's account'
	mapping(address => mapping(address => uint)) allowed;
	function FixedToken()
	{
		balances[msg.sender] = totalTokens;
	}

	// ERC20TokenI functions
	function totalSupply()
		public
		constant
		returns (uint totalSupply)
	{
		totalSupply = totalTokens;
	}

	function balanceOf(address _owner)
		public
		constant
		returns (uint balance)
	{
		balance = balances[_owner];
	}

	function transfer(address _to, uint _value)
		public
		returns (bool success)
	{
		require(_to != address(0));
		require(_value > 0);
		require(balances[msg.sender] >= _value);
		// handle overflow
		require(balances[_to] + _value > balances[_to]);

		balances[msg.sender] -= _value;
		balances[_to] += _value;
		Transfer(msg.sender, _to, _value);
		return true;
	}

	function transferFrom(address _from, address _to, uint _value)
		public	
		returns (bool success)
	{
		require(_from != address(0));
		require(_to != address(0));

		// TODO
		return true;
	}


	// the owner of the contract can allow others to call transferFrom the owner's account
	function approve(address _spender, uint _value)
		public
		fromOwner()
		returns (bool success)
	{
		allowed[msg.sender][_spender] = _value;
		return true;
	}

	function allowance(address _owner, address _spender)
		constant
		returns (uint remaining)
	{
		remaining = allowed[_owner][_spender];
	}


}
