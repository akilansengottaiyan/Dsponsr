// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './Recipients.sol';

import './Sponsors.sol';

contract Applications is Recipients, Sponsors {
  struct Application {
    address payable applicant;
    address[] sponsorsAddress;
    uint256 totalFundNeeded;
    uint256 dueDate;
    uint256 fundCollected;
    bool isSettled;
  }
  mapping(address => uint256) recipientApplications;
  Application[] applications;

  event ApplicationSponsored(Application, Sponsor);

  constructor() {
    Application memory a;
    a.isSettled = true;
    applications.push(a);
  }

  modifier onlySponsor() {
    require(
      sponsorToIdMapping[msg.sender] != 0,
      'Only sponsors can call this function'
    );
    _;
  }
  modifier onlyRecipient() {
    require(
      recipientAddresses[msg.sender] != 0,
      'Only recipient can call this function'
    );
    _;
  }

  function addApplication(uint256 _totalFundNeeded, uint256 _dueDate)
    external
    onlyRecipient
  {
    require(
      recipientApplications[msg.sender] != 0 ||
        applications[recipientApplications[msg.sender]].isSettled == true,
      'Recipient already have an unsettled application'
    );
    Application memory a;
    a.totalFundNeeded = _totalFundNeeded;
    a.dueDate = _dueDate;
    applications.push(a);
    recipientApplications[msg.sender] = applications.length - 1;
  }

  function sponsorApplication(uint256 _applicationId, uint256 _fund)
    external
    onlySponsor
  {
    Application storage a = applications[_applicationId];
    Sponsor storage s = sponsors[sponsorToIdMapping[msg.sender]];
    require(s.fundRemaining >= _fund, 'Insufficient fund');
    require(
      _fund <= (a.totalFundNeeded - a.fundCollected),
      'Amount cannot be greater than the required amount'
    );
    s.fundRemaining -= _fund;
    a.fundCollected += _fund;
    a.sponsorsAddress.push(msg.sender);
    emit ApplicationSponsored(applications[_applicationId], s);
  }

  function getApplication(uint256 _id)
    public
    view
    returns (Application memory)
  {
    return applications[_id];
  }

  function withDrawFund() external onlyRecipient {
    Application storage a = applications[recipientApplications[msg.sender]];
    require(
      a.fundCollected == a.totalFundNeeded || a.dueDate <= block.timestamp,
      'Have to wait until total funds are collected or due date ellapses'
    );
    a.isSettled = true;
    a.applicant.transfer(a.fundCollected);
  }
}
