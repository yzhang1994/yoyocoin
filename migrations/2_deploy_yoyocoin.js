const YoyoCoin = artifacts.require("./YoyoCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(YoyoCoin);
};
