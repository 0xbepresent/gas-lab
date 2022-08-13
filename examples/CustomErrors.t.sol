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
        c0.withOutCustomError();
        c1.withCustomError();
    }
}

contract Contract0 {
    function withOutCustomError() public view {
        require(true == false, "This is my error");
    }
}

contract Contract1 {
    error MyCustomError();
    function withCustomError() public view {
        if(true != false){
            revert MyCustomError();
        }
    }
}