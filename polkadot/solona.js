const { Wallet, Contract } = require("@solana/web3.js");

// Connect to a local Solana cluster
const cluster = new Contract('https://api.solana.com');

async function main() {
  // Generate a new random wallet
  const wallet = new Wallet(Math.random().toString(36).substring(2));
  console.log("Public Key:", wallet.publicKey);

  // Load the NFT contract
  const contractAddress = "NFT_CONTRACT_ADDRESS_HERE";
  const contract = await Contract.load(contractAddress, cluster);

  // Create a new NFT
  const response = await contract.createNFT(wallet.publicKey, "My NFT");
  console.log("NFT Created:", response);
}

main();
