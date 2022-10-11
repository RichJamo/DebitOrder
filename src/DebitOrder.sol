pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DebitOrder is Ownable {
    address public constant USDC_ADDRESS =
        0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
    address public constant MARIUS_ADDRESS =
        0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
    address public keeperAddress;
    uint256 public paymentAmount = 10000000; //10 USDC

    function setKeeper(address _keeperAddress) public onlyOwner {
        keeperAddress = _keeperAddress;
    }

    function approve(uint256 amount_to_approve) public {
        IERC20(USDC_ADDRESS).approve(address(this), amount_to_approve);
    }

    function deposit(uint256 amount) public {
        IERC20(USDC_ADDRESS).transferFrom(msg.sender, address(this), amount);
    }

    function payMarius() public {
        require(msg.sender == keeperAddress);
        IERC20(USDC_ADDRESS).transfer(MARIUS_ADDRESS, paymentAmount);
    }

    function withdraw(uint256 amount) public onlyOwner {
        IERC20(USDC_ADDRESS).transfer(msg.sender, amount);
    }
}
