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
        address[] memory addrs = new address[](1);
        addrs[0] = address(0x0);
        c0.withMemoryParam(addrs);
        c1.withCallDataParam(addrs);
    }
}

contract Contract0 {
    function withMemoryParam(address[] memory _addresses) external returns(address[] memory) {
        return _addresses;
    }
}

contract Contract1 {
    function withCallDataParam(address[] calldata _addresses) external returns(address[] memory){
        return _addresses;
    }
}