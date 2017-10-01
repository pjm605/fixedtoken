pragma solidity ^0.4.13;

contract Owned {

	event LogOwnerSet(address previousOwner, address owner);

	address owner;


	modifier fromOwner {
		require(msg.sender == owner);
		_;
	}

	function Owned() {
		owner = msg.sender;
	}

	function setOwner(address newOwner)
		fromOwner
		returns(bool success)
	{
		require(newOwner != address(0));
		require(owner != newOwner);
		address previousOwner = owner;
		owner = newOwner;

		LogOwnerSet(previousOwner, owner);

		return true;
	}

	function getOwner()
		constant
		returns(address)
	{
		return owner;
	}
}
