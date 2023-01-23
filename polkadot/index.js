const { ApiPromise, WsProvider } = require('@polkadot/api');
const { Keyring } = require('@polkadot/api');




const createAccount = async (req, res)=>{
const provider = new WsProvider('wss://rpc.polkadot.io');
const api = await ApiPromise.create({ provider});
const keyring = new Keyring({ type: 'sr25519' });
const newAccount = keyring.addFromUri('//Alice');
console.log(newAccount.address);

}


const checkbalance = async (req,res)=>{
const provider = new WsProvider('wss://rpc.polkadot.io');
const api = await ApiPromise.create({ provider});
const address = '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY';
const balance = await api.query.balances.freeBalance(address);
console.log(balance.toString());

}

const transfer = async (req,res)=>{
const provider = new WsProvider('wss://rpc.polkadot.io');
const api = await ApiPromise.create({ provider});
 const transfer
}

createAccount()
checkbalance()