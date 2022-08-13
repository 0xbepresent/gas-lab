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
        c0.withOutUnChecked(10);
        c1.withUnchecked(10);
    }
}

contract Contract0 {
    function withOutUnChecked(uint256 a) public pure {
        uint256 j = 0;
        for (uint256 i; i < a; ++i) {
            j++;
        }
    }
}

contract Contract1 {
    function withUnchecked(uint256 a) public pure {
        uint256 j = 0;
        for (uint256 i; i < a;) {
            j++;
            unchecked {
                ++i;
            }
        }
    }
}