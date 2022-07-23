//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game {
    constructor() payable{}

    function pickACard() public view returns(uint){
        uint pickedCard = uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp)));
          return pickedCard;
    }

    function guess(uint num) public {
        uint cardNumber = pickACard();
        if(num == cardNumber){
            (bool sent,) = msg.sender.call{value: 0.1 ether}("");
            require(sent, "Failed to send ether");
        }
        
    }

    function getBalance() public view returns(uint) {
        return (address(this).balance);
    }

}