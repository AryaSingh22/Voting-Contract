// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    enum VoteStates { Absent, Yes, No }
    uint constant VOTE_THRESHOLD = 10;

    struct Proposal {
        address target;
        bytes data;
        bool executed;
        uint yesCount;
        uint noCount;
        mapping(address => VoteStates) voteStates;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;

    event ProposalCreated(uint indexed proposalId);
    event VoteCast(uint indexed proposalId, address indexed voter);
    event ExecutionFailed(uint indexed proposalId);

    constructor(address[] memory _members) {
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
        members[msg.sender] = true; // contract deployer is a member
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Not a member");
        uint proposalId = proposals.length;
        emit ProposalCreated(proposalId);
        Proposal storage proposal = proposals.push();
        proposal.target = _target;
        proposal.data = _data;
    }

    function castVote(uint _proposalId, bool _supports) external {
        require(members[msg.sender], "Not a member");
        Proposal storage proposal = proposals[_proposalId];

        // Remove previous vote
        if (proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if (proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        // Add new vote
        if (_supports) {
            proposal.yesCount++;
            proposal.voteStates[msg.sender] = VoteStates.Yes;
        } else {
            proposal.noCount++;
            proposal.voteStates[msg.sender] = VoteStates.No;
        }

        emit VoteCast(_proposalId, msg.sender);

        // Execute if threshold is reached and not already executed
        if (proposal.yesCount == VOTE_THRESHOLD && !proposal.executed) {
            proposal.executed = true; // Prevent reentrancy before call
            (bool success, ) = proposal.target.call(proposal.data);
            if (!success) {
                emit ExecutionFailed(_proposalId);
            }
        }
    }
}
