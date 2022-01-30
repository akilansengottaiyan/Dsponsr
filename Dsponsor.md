# [Dsponsor]

A intermediary Dapplication to connect sponsors and applicants.
## Personas
sponsor
applicant
user
developer


### Iteration 1 (Core Dapp): 
##### Applicant : 
- Use webapp to connect to ethereum using providers like metamask.
- Should fill a form with name,address,phno,email,photograph,dob,gender.
- Should submit a letter(in pdf format) describing the need for the sponsorship.
- Attaching the relevant certificates and receipts would help to acquire the sponsorship.

##### Sponsor : 
- Use webapp to register as a sponsor.
- Fill details like name,address,contact (optional)
- Should sent the fund upfront (as he wish obeying the minmax criteria) to the contract.
- Should vote for the applicant whether he should receive fund from your allocation in the contract.
- Could withdraw the fund post the threshold time if the fund is not yet used.
- Can see all the other sponsors with their balance in the contract.

##### User : 
- Can see the sponsorships provided so far and the related applications
- Can see the applications pending for sponsorships
- Should use chain link price feed to get price in dollars.

##### Developer : 
- Who can write code and deploy the contract.

### Iteration 2 (DAO) :
- Introduce governance token to the Dapp and allocate to the sponsors and applicants.
- Should make sure opensource code should match the deployed contract.
- Sponsors can vote for the the new features to be added or modified.
- Applicants who received sponsorship already can vote for the new features.
- Developer will also have some governance coin.

### Iteration 3 (Preventing malicious applications)
- Only certain percentage of the sponsorship amt would be send to the wallet as it is.
- The remaining percentage should be spend in the form of paying fees directly or booking travel tickets or hotel tickets by accessing the api if any. To do this, assumption is that every ticket agency got their own ethereum acct to which we can transfer the eth or some other stable token and send the transaction with the details needed.

### Iteration 4 (ENS resolution)
 - Register Ens name for the Dapp.
 - Ens resolution for the ticket agency and universities to which we can send ethereum.

### Iteration 5 (Preserve value and use it)
 - To preserve the value of the fund in the contract, lets tie it with stable coins like USDT which is stay in the range forever.
 - Use uniswap to swap the tokens to stable tokens and hold it in the contract.
 - Then send the stable coins to the applicant acct which they can sell and have the money in their bank acct in traditional contract
 
## Development:
 - React and tailwind css to develop PWA.
 - Truffle suite to manage and deploy contracts.
 - Use Polygon the layer2 solution.
 - Commit should be a meaningful one for every tasks.
 - IPFS to store the application details
 