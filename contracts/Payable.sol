pragma solidity ^0.5.16;

contract Wallet{

    event Deposit(address sender, uint amount, uint balance);
    event Withdraw(uint amount, uint balance);
    event Transfer(address to, uint amount, uint balance);

    address payable public owner;

    constructor() public payable{
        owner = msg.sender;
    }

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function notPayble() public {

    }

    modifier onlyOwner() {
        require(msg.send == owner, "not owner");
        _;
    }

    function withdraw(uint _amount) public onlyOwner {
        owner.transfer(_amount); //transfer function that we defined
    }

    function transfer(address payable _to, uint _amount) public onlyOwner {
       _to.transfer(_amount); //transfer function that is available only for payable address
       emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }





}