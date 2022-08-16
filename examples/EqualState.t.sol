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

    function testGas() public{
        c0.withEqualPlusState();
        c1.withOutEqualPlusState();
    }
}

contract Contract0 {
    uint256 i;
    function withEqualPlusState() public {
        i += 1;
    }
}

contract Contract1 {
    uint256 i;
    function withOutEqualPlusState() public {
        i = i + 1;
    }
}