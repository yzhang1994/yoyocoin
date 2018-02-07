pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract YoyoCoin is StandardToken {
    function () public { revert(); }

    string public name;
    uint8 public decimals;
    string public symbol;

    function YoyoCoin() public {
        totalSupply_ = 10000;
        balances[msg.sender] = 500;             // Give the creator all initial tokens (100000 for example)
        name = "YoyoCoin";                      // Set the name for display purposes
        decimals = 0;                           // Amount of decimals for display purposes
        symbol = "YOY";                         // Set the symbol for display purposes
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        if(!_spender.call(bytes4(bytes32(keccak256("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { revert(); }
        return true;
    }
}
