const {ethers} = require ("hardhat");

async function main(){
  const TokenContract = await ethers.getContractFactory("Token");
  const deployedTokenContract = await TokenContract.deploy();
  await deployedTokenContract.deployed();

  console.log("Deployed Token Address :", deployedTokenContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) =>{
    console.error(error);
    process.exit(1);
  });
