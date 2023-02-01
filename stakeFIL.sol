// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <=0.8.17;
contract stakeFIL{
    mapping(address => uint256) userStakeMapping;
    mapping(address => uint256) nowEpoch;
    mapping(address => uint256) withdrawEligible;
    function stake(uint256 _duration) public payable {
        userStakeMapping[msg.sender] += msg.value;
        nowEpoch[msg.sender] = block.timestamp;
        withdrawEligible[msg.sender] = block.timestamp + _duration;
    }
    function readStake() public view returns(uint256) {
        return userStakeMapping[msg.sender];
    }
    function readEpoch() public view returns(uint256) {
        return nowEpoch[msg.sender];
    }
    function readWithdrawEligibility() public view returns(uint256) {
        return withdrawEligible[msg.sender];
    }
    function rightNow() public view returns(uint256){

    return block.timestamp;
    }
   
    function withdraw(address payable _address, uint256 _value) public payable {
        require(block.timestamp > withdrawEligible[msg.sender],"please wait");
        _address.transfer(_value);
        userStakeMapping[msg.sender] = userStakeMapping[msg.sender] - _value;
    }
}