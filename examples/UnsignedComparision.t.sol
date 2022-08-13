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

    function testGas() public {
        c0.withGraterThan(10);
        c1.withNotEqual(10);
    }
}

contract Contract0 {
    function withGraterThan(uint256 a) public pure {
        require(a > 0, "a > 0");
    }
}

contract Contract1 {
    function withNotEqual(uint256 a) public pure {
        require(a != 0, "a != 0");
    }
}