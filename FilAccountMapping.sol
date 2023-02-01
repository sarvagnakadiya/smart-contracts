// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <=0.8.17;
contract fakeAccount{
    // string[] isSpAdded;
    mapping(address => string) addressToSpMapping;
    mapping(address => bool) public isSpAdded;
    function addStorageProvider(string memory _sp) public {
        require(isSpAdded[msg.sender] == false,"SP already added");
        addressToSpMapping[msg.sender] = _sp;
        isSpAdded[msg.sender] = true;
    }
    function getStorageProvider() public view returns(string memory){
        return addressToSpMapping[msg.sender];
    }
}
