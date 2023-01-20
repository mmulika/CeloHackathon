// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

import './NewsToken.sol';


contract NewsCertificate is News{
    constructor(){}
        string public constant _name ="Okoa Nature";
        string public constant _symbol ="OKA";


mapping(uint => address) internal idToOwner;
mapping(uint => address) internal idToApproval;
mapping(address => uint) private ownerToNFTokenCount;
mapping(address => uint) public  burnTokens;

function addBurnedTokens(address holder)public{
    
    if(burnTokens = true){
        uint burnedtok = totalApprovedForBurn[holder];
        burnTokens[holder]+=burnedtok;
    
}
function mint(address _to,uint256 _tokenId) internal virtual{
    require(_to !=address(0), "ZERO_ADDRESS");
    require(idToOwner[_tokenId] == address(0),"NFT_ALREADY_EXISTS");
    require(burnTokens[_to] > 20);
    _addNFToken(_to,_tokenId);
    emit Transfer(address(0),_to,_tokenId);
}    

function _addNFToken(
    address _to,
    uint256 _tokenId
)internal virtual{
    require(idToOwner[_tokenId] == address(0),"NFT_ALREADY_EXISTS");
    idToOwner[_tokenId] = _to;
    ownerToNFTokenCount[_to] = ownerToNFTokenCount[_to] + (1);
}
    
}