pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Multiplication {

	uint public prod = 1;

	constructor() public {
		require(tvm.pubkey() != 0, 101);
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}

	modifier checkOwnerAndAccept {
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
		_;
	}

	function mul(uint value) public checkOwnerAndAccept {
		require(value <= 10 && value >= 1, 103);
        	prod *= value;
	}
}
