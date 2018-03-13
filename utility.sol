pragma solidity ^0.4.0;

contract utility {

 modifier notOwner(address owner) {
     require(owner != msg.sender);
     _;
 }
 
 function addNumber(uint a, uint b) internal returns(uint){
     return a + b;
 }
}