//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjUwMCIgaGVpZ2h0PSI1MDAiPjx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+IGhpISBZb3UgZGVjb2RlZCB0aGlzISA8L3RleHQ+PC9zdmc+";
        string memory svg =
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="500" height="500"><text x="0" y="15" fill="black"> hi! You decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}
