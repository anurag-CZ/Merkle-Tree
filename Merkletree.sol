//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleTree {
    bytes32 public rootHash = 0xb3e487a5d294d3a8f03a56e557263e45788e56088d1031392f35cf1a41f39221;
    string[] public data;

    function addData(string[] memory _data) public {
        data = _data;
    }

    function merkleProof(bytes32[] memory _merkleProof) public view returns(bool, bytes32){
        bytes32 leafhash = keccak256(abi.encodePacked(data[0]));
        return (MerkleProof.verify(_merkleProof, rootHash , leafhash), leafhash);
    }
}

