// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;




contract SendEther { 
    constructor() payable {}

receive() external payable { }
function sendViaTransfer (address payable _to) external payable { 
    _to.transfer(100);
}
function sendViaSend (address payable _to) external payable { 
    bool sent = _to.send(100);
    require(sent, "Sending failed.");
}
function sendViaCall (address payable _to) external payable { 
    (bool success, ) = _to.call{value: 100}("");
    require(success, "Call failed.");
}
}

contract ReceiveEther {
    event Log(uint amount, uint gas);

    receive() external payable {
    emit Log(msg.value, gasleft());
}}