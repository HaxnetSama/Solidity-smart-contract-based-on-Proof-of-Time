// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfTime {
    uint public startTime;
    uint public endTime;
    address public owner;

    constructor(uint _duration) {
        startTime = block.timestamp;
        endTime = startTime + _duration;
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can perform this action.");
        _;
    }

    modifier onlyDuringTimeframe {
        require(block.timestamp >= startTime && block.timestamp < endTime, "This action can only be performed during the designated time period.");
        _;
    }

    function claimReward() public onlyOwner onlyDuringTimeframe {
        // Perform action for reward distribution
    }

    function extendTime(uint _duration) public onlyOwner onlyDuringTimeframe {
        endTime += _duration;
    }
}
