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
    // this is creating an object as "string": 8bitnumber
    mapping(string => uint8) existingURIs;

    // create a URI that will give direct access to the bucket and where the NFT is located.
    // ERC721 takes name of contract, and token.
    constructor() ERC721("TinyArt", "TNY") {}

    // this function is an internal can only run once with this function
    //a pure function will not have access to anything that can be mutable in the future. Declare what the function is taking in and then it takes the type of memory
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    // address to is the person who is getting the token.Everyone who utilizes the ehterium network has a unique address. The address/string are data types
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        eixstingURIs[uri] = 1;
    }

    // If it finds something it returns 1, else nothing.
    // Solidity does not have truthy or falsy. It only has the boolean type. So this should be an expression. Equality is expressed as a boolean. It does not have "truthy" or 'falsy" values.
    function isContentOwned(string memory uri) public view returns (bool) {
        return existingURIs[uri] == 1;
    }
}
