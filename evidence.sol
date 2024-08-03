// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
    contract EvidenceManagement {

struct Evidence {

string hash; 
string description; 
address submitter;
 uint256 timestamp;

}


mapping (string  => Evidence) public evidenceMap;

event

EvidenceSubmitted (string  hash, string description, address submitter);

function submitEvidence(string memory _hash, string memory _description) public {

require(msg.sender != address(0), "Submitter cannot be zero address");

Evidence storage evidence = evidenceMap[_hash];
 evidence.hash = _hash; 
 evidence.description = _description;
 evidence.submitter =msg.sender;

evidence.timestamp=block.timestamp;

emit EvidenceSubmitted(_hash,_description, msg.sender); }

function getEvidence (string memory _hash) public view returns (Evidence memory) {

return evidenceMap[_hash];

}

}
