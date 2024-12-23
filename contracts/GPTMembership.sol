pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GPTMembership is ERC721{
    address public owner;
    uint256 public membershipTypes;
    uint256 public totalMemberships;
    string public MY_CONTRACT = "ANTON VOSHCHINSKIY"

    struct Membership {
        uint256 id;
        string name;
        uint256 cost;
        string date;
    }

    struct UserMembership {
        uint256 id;
        uint256 membershipId;
        address adressUser;
        uint256 cost;
        string expireDate;
    }

    mapping(address => UserMembership) userMemberships;
    mapping(uint256 => Membership) memberships;
    mapping(uint256 => mapping(address => bool)) public hasBought;
    mapping(uint256 => mapping(uint256 => address)) public membershipTaken;
    mapping(uint256 => uint256[]) membershipsTaken;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}