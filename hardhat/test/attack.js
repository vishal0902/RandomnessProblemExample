const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');
const {BigNumber, utils} = require('ethers');

describe('Attack', () => { 
  it('Should be able to guess the number ', async () => {
    const gameContractFactory = await ethers.getContractFactory("Game");
    const gameContract = await gameContractFactory.deploy({value:utils.parseEther("0.1")});
    await gameContract.deployed();
    


    // Deploy the attack contract
    const Attack = await ethers.getContractFactory("Attack");
    const _attack = await Attack.deploy(gameContract.address);

    console.log("Attack contract address", _attack.address);

    // Attack the Game contract
    const tx = await _attack.attack();
    await tx.wait();

    const balanceGame = await gameContract.getBalance();
    // Balance of the Game contract should be 0
    expect(balanceGame).to.equal(BigNumber.from("0"));
  });
});
