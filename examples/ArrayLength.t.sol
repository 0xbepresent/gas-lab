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
        c0.withArrayLengthInside();
        c1.withArrayLengthOutside();
    }
}

contract Contract0 {
    uint[] myarray = [1, 2, 3];
    function withArrayLengthInside() public view {
        uint256 j = 0;
        for (uint256 i; i < myarray.length; ++i) {
            j++;
        }
    }
}

contract Contract1 {
    uint[] myarray = [1, 2, 3];
    function withArrayLengthOutside() public view {
        uint256 j = 0;
        uint256 len = myarray.length;
        for (uint256 i; i < len; ++i) {
            j++;
        }
    }
}