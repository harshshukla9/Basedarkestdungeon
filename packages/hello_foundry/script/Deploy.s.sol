// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DarkestDungeon} from "../src/DarkestDungeon.sol";
import {Dungeon} from "../src/Token/Gametoken.sol"; // Import the Dungeon token contract

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = 0x0000000000000000000000000000000000000000000000000000000000000000; // 0000->deployerprivate key
       address deployerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        console.log("Deploying contracts using deployer address:", deployerAddress);

        address gasbackAddress = 0xdF329d59bC797907703F7c198dDA2d770fC45034;

        // Deploy Dungeon Token first
        Dungeon dungeonToken = new Dungeon();
        console.log("Deployed Dungeon Token at address: %s", address(dungeonToken));

        // Deploy DarkestDungeon with Dungeon token address
        DarkestDungeon game = new DarkestDungeon(deployerAddress, gasbackAddress, address(dungeonToken));
        console.log("Deployed Darkest Dungeon at address: %s", address(game));

        vm.stopBroadcast();
    }
}
// forge script script/Deploy.s.sol --rpc url https://rpc.test.btcs.network/ --private-key  --broadcast

// forge script script/Deploy.s.sol https://rpc.test.btcs.network/  --broadcast

//

// forge script script/Deploy.s.sol --rpc-url https://rpc.coredao.org/ --private-key  --broadcast



//  forge script script/Deploy.s.sol --rpc-url https://sepolia.base.org/ --private-key  --broadcast --legacy --gas-price 1000000001

//Core
//  Deploying contracts using deployer address: 0xd4E4e3fAc5Df59f8C7230d055fd4C252f4d111df
//   Deployed Dungeon Token at address: 0x3E9A7bAdd6c3711125d4867733E3F1ee9b1D7943
//   Deployed Darkest Dungeon at address: 0x328a5AFdCCba55195C1ca98c76F58b1a80A70fCa


//BaseTestnet

// Deploying contracts using deployer address: 0x58369AAED363a59022c98CD457Ea5e320Df395EB
//   Deployed Dungeon Token at address: 0x83F159aa37D8Bec7DE4651e9421c1f2db915A738
//   Deployed Darkest Dungeon at address: 0x1561Ca01EE9E3978Df9ac49dcA0d8e8f30929110