pragma solidity ^0.4.0;

contract mieiModifier {

 modifier isOwner(address owner) {
     require(owner == msg.sender);
     _;
 }
}