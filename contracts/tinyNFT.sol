// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// IMported individual classes and now wwe are importing them

contract TinyArt is ERC721, ERC721URIStorage, Ownable {
    // using a function Counter from the class Counters
    using Counters for Counters.Counter;

    // making this private
    Counters.counter private _tokenIdCounter;

    // unique 8 bit unsigned integer
    mapping(string => uint8) existingURIs;

    // create a URI that will give direct access to the bucket and where the NFT is located.
    // ERC721 takes name of contract, and token.
    constructor() ERC721("TinyArt", "TNY") {}
};
