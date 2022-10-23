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
        c0.withOutUnusedVariable();
        c1.withUnusedvariable();
    }
}

contract Contract0 {
    function withOutUnusedVariable() public view returns(bool){
        return true;
    }
}

contract Contract1 {
    uint internal constant lock = 86400 * 7 * 52 * 4;
    function withUnusedvariable() public view returns(bool){
        return true;
    }
}