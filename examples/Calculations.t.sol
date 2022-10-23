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
        c0.withOuCalculations();
        c1.withCalculations();
    }
}

contract Contract0 {
    uint internal constant week = 7 days;
    function withOuCalculations() public view returns(uint){
        return week;
    }
}

contract Contract1 {
    uint internal constant week = 86400 * 7; 
    function withCalculations() public view returns(uint){
        return week;
    }
}