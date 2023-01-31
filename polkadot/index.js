const { ApiPromise, WsProvider } = require('@polkadot/api');
const { Keyring } = require('@polkadot/api');




const createAccount = async (req, res)=>{
const provider = new WsProvider('wss://rpc.polkadot.io');
const api = await ApiPromise.create({ provider});
const keyring = new Keyring({ type: 'sr25519' });
const newAccount = keyring.addFromUri('//Alice');
console.log(`Private key: ${account.privateKey}`);
console.log(`Public key: ${account.publicKey}`);

}


const checkbalance = async (req,res)=>{
const provider = new WsProvider('wss://rpc.polkadot.io');
const api = await ApiPromise.create({ provider});
const address = '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY';
const balance = await api.query.balances.freeBalance(address);
console.log(balance.toString());

}
const createAccount1 = async( req,res,next)=>{
    const keyring =  await new Keyring({ type: 'sr25519' });
    const account =  await keyring.addFromUri('//Alice');
    console.log(`Private key: ${account.privateKey}`);
console.log(`Public key: ${account.publicKey}`);



};

const { waitReady } = require('@polkadot/wasm-crypto');

waitReady().then(() => {

        const provider = new WsProvider('wss://rpc.polkadot.io');
        const api = await ApiPromise.create({ provider});
        const keyring = new Keyring({ type: 'sr25519' });
        const newAccount = keyring.addFromUri('//Alice');
        console.log(`Private key: ${account.privateKey}`);
        console.log(`Public key: ${account.publicKey}`);
        
        

});


createAccount()
// checkbalance()

