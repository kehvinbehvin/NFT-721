// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
pragma abicoder v2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "../utils/AccessProtected.sol";

contract MissionDAO is ERC721URIStorage, AccessProtected {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MissionDAO", "MDAO") public {
    }


    /**
     * @notice - Mint NFT
     * @dev - callable only by admin
     *
     * @param recipient - mint to
     * @param tokenId - ID assigned to the token
     * @param URI - uri of the land data
     */
    function mint(address recipient,uint256 tokenId, string memory URI)
    external
    onlyAdmin
    {
        _mint(recipient, tokenId);
        _setTokenURI(tokenId, URI);
    }

    /**
     * @notice - Set URI for token
     * @dev - callable only by admin
     *
     * @param tokenId - Token ID of NFT
     * @param tokenURI - URI to set
     */
    function setURI(uint256 tokenId, string memory tokenURI)
    external
    onlyAdmin
    {
        _setTokenURI(tokenId, tokenURI);
    }

    /**
     * @notice - Set URI for token batch
     * @dev - callable only by admin
     *
     * @param tokenIds - Token IDs of NFTs
     * @param tokenURIs - URIs to set
     */
    function setBatchURI(uint256[] memory tokenIds, string[] memory tokenURIs)
    external
    onlyAdmin
    {
        require(tokenIds.length == tokenURIs.length, "Length mismatch");
        for (uint256 i = 0; i < tokenIds.length; i++) {
            _setTokenURI(tokenIds[i], tokenURIs[i]);
        }
    }
}