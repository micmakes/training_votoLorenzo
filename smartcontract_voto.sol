pragma solidity ^0.4.0;

import "./mieimodifier.sol"; //qui sono contenunti i miei modifier
import "./utility.sol"; 

contract votazione is mieiModifier, utility {
    mapping (address => uint) listaCandidatiVoti;
    mapping (address => bool) listaVotanti;
    uint massimoVoti = 0;
    address owner = msg.sender;
    address vincitore;
    
    function votazione() payable {
        
    }
    
    function addizione() public returns (uint){
        return 3 + addNumber(2, 3);
    }
    
    function aggiungimiComeCandidato() public {
        listaCandidatiVoti[msg.sender] = 0;
    }
    
    modifier haVotato(){
        require(listaVotanti[msg.sender] == false);
        _;
    }
    
    function voto(address _candidato) public haVotato() {
        listaCandidatiVoti[_candidato]++;
        listaVotanti[msg.sender] = true;
        if(massimoVoti < listaCandidatiVoti[_candidato]){
            massimoVoti = listaCandidatiVoti[_candidato];
            vincitore = _candidato;
        }
    }
    
    function getVincitore() public view returns(address){
        return vincitore;
    } 
    
    function daiPremio() public isOwner(owner){
        vincitore.send(this.balance);
    }
    
    function vediBilancio() public isOwner(owner) view returns(uint){
        return this.balance;
    }
    
    //address "0x32423423" string "lorenzo" numbers 13
    
    
    function mieiVoti() public view returns(uint){
        return listaCandidatiVoti[msg.sender];
    }
}