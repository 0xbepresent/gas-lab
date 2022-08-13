// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.14;

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
        c0.withOutStorage(5);
        c1.withStorage(5);
    }
}

contract Contract0 {
    struct Foo {
        uint x;
        uint a;
        uint y;
        uint b;
        uint z;
    }
    mapping(uint=>Foo) data;

    constructor() {
        data[100] = Foo({x:0,a:1,y:0,b:2,z:0});
    }

    function withOutStorage(uint idx) external view returns (uint){
        uint a = data[idx].a;
        a *= 2;
        uint b = data[idx].b;
        return a + b;
    }
}

contract Contract1 {
    struct Foo {
        uint x;
        uint a;
        uint y;
        uint b;
        uint z;
    }
    mapping(uint=>Foo) data;

    constructor() {
        data[100] = Foo({x:0,a:1,y:0,b:2,z:0});
    }

    function withStorage(uint idx) external view returns (uint) {
        Foo storage f = data[idx];
        uint a = f.a;
        a *= 2;
        uint b = f.b;
        return a + b;
    }
}
