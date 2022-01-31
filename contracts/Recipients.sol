// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Recipients {
  struct Recipient {
    string name;
    string residentialAddress;
    string phNo;
    string email;
    string photoUrl;
    uint256 dob;
    string coverLetterUrl;
    string certificatesUrl; //ipfs
  }
  mapping(address => uint256) recipientAddresses;

  event RecipentAdded(uint256);

  Recipient[] recipients;

  constructor() {
    Recipient memory r;
    recipients.push(r);
  }

  function addRecipient(
    string memory _name,
    string memory _address,
    string memory _email,
    string memory _phNo,
    string memory _photoUrl,
    string memory _coverLetterUrl,
    uint256 _dob
  ) public {
    Recipient memory r;
    r.name = _name;
    r.phNo = _phNo;
    r.residentialAddress = _address;
    r.email = _email;
    r.photoUrl = _photoUrl;
    r.dob = _dob;
    r.coverLetterUrl = _coverLetterUrl;
    recipientAddresses[msg.sender] = recipients.length;
    recipients.push(r);
    emit RecipentAdded(recipients.length - 1);
  }

  function setCertificatesUrl(uint256 _id, string calldata _url) public {
    Recipient storage r = recipients[_id];
    r.certificatesUrl = _url;
  }

  function getRecipient(uint256 _id) public view returns (Recipient memory) {
    return recipients[_id];
  }
}
