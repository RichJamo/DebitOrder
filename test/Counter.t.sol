// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/DebitOrder.sol";

contract CounterTest is Test {
    DebitOrder public debitOrder;

    function setUp() public {
        debitOrder = new DebitOrder();
        // debitOrder.setNumber(0);
    }

    // function testIncrement() public {
    //     debitOrder.increment();
    //     assertEq(debitOrder.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     debitOrder.setNumber(x);
    //     assertEq(debitOrder.number(), x);
    // }
}
