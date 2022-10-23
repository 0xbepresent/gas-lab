// Usign the gas-lab as a reference https://github.com/0xKitsune/gas-lab
// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.12;

import "../../lib/test.sol";
import "../../lib/Console.sol";

contract GasTest is DSTest {
    Contract0 c0;
    Contract1 c1;

    function setUp() public {
        c0 = new Contract0();
        c1 = new Contract1();
    }

    function testGas() public view{
        c0.withOutInt();
        c1.withInit();
    }
}

contract Contract0 {
    uint public boost;

    function withOutInt() public view returns(uint){
        return boost;
    }
}

contract Contract1 {
    uint public boost;

    constructor() {
        boost = 0;
    }

    function withInit() public view returns(uint){
        return boost;
    }
}