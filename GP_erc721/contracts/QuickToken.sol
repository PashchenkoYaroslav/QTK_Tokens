// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, Ownable {
    string public info;
    address public tokenOwner;
    uint256 private tokenId;

    constructor(string memory _info, uint256 _tokenId) ERC721("QuickToken", "QTK") {
        info = _info;
        tokenOwner = msg.sender;
        tokenId = _tokenId;
    }

    function safeMint(address to, uint256 tokenId) public accessByOwner {
        _safeMint(to, tokenId);
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function changeInfo(string memory _info) external accessByOwner {
        info = _info;
    }

    modifier accessByOwner() {
        require(tokenOwner == msg.sender, "Not owner");
        _;
    }
}
