// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity ^0.8.0;

import "./uniswap/IUniswapV2Pair.sol";

/// @dev SyncSwap pair interface with full Uniswap V2 compatibility
interface ISyncSwapPair is IUniswapV2Pair {
    function getPrincipal(address account) external view returns (uint112 principal0, uint112 principal1, uint32 timeLastUpdate);
    function swapFor0(uint amount0Out, address to) external; // support simple swap
    function swapFor1(uint amount1Out, address to) external; // support simple swap

    function getReservesAndAmplifier() external view returns (uint112 reserve0, uint112 reserve1, uint32 liquidityAmplifier);
    function getReservesSimple() external view returns (uint112, uint112);

    function swapFeePointOverride() external view returns (uint16);
    function setSwapFeePointOverride(uint16 newSwapFeePointOverride) external;

    function liquidityAmplifier() external view returns (uint32);
    function setLiquidityAmplifier(uint32 newLiquidityAmplifier) external;
}