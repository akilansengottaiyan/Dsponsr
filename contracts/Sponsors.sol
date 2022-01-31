// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sponsors {
  struct Sponsor {
    string name;
    string phNo;
    string email;
    uint256 fundRemaining;
  }
  Sponsor[] sponsors;
  mapping(address => uint256) sponsorToIdMapping;

  constructor() {
    Sponsor memory s;
    sponsors.push(s);
  }

  function addSponsor(
    string calldata _name,
    string calldata _email,
    string calldata _phNo
  ) public payable {
    require(
      msg.value >= 0.1 ether && msg.value <= 10 ether,
      'Amount cannot be lesser than 0.1eth or greater than 10 eth'
    );
    Sponsor memory s;
    s.name = _name;
    s.email = _email;
    s.phNo = _phNo;
    sponsorToIdMapping[msg.sender] = sponsors.length;
    s.fundRemaining = msg.value;
    sponsors.push(s);
  }

  function getSponsor(uint256 _id) public view returns (Sponsor memory) {
    return sponsors[_id];
  }
}
