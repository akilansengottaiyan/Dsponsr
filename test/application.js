const Applications = artifacts.require('./Applications.sol')

contract('Applications', (accounts) => {
  let app
  let recipients = []
  let sponsors = []
  let applications = []
  before(async () => {
    app = await Applications.deployed()
  })
  it('...should register recipient.', async () => {
    let x = await app.addRecipient(
      'akil',
      'my address',
      'aki@g.com',
      '1234',
      'photourl1',
      'coverletterurl',
      new Date('06/03/1997').getTime() / 1000,
      { from: accounts[1] }
    )
    const recipient = await app.getRecipient(1)
    assert.equal(recipient.name, 'akil', 'Recipient is not inserted right.')
  })
  it('...should register sponsor.', async () => {
    await app.addSponsor('sponsor1', 'sp@g.com', '1234', {
      from: accounts[2],
      value: 2 * 10 ** 18
    })
    const sponsor = await app.getSponsor(1)
    assert.equal(sponsor.name, 'sponsor1', 'Recipient is not inserted right.')
  })
  it('...should register application.', async () => {
    await app.addApplication(
      (10 ** 18).toString(),
      new Date().getTime() / 1000 + 0.25 * 60,
      {
        from: accounts[1]
      }
    )
    x = await app.getApplication(1)
  })
  it('...sponsor should sponsor the application.', async () => {
    await app.sponsorApplication(1, (10 ** 17).toString(), {
      from: accounts[2]
    })
    let x = await app.getApplication(1)
    console.log(x)
    assert.equal(
      x.sponsorsAddress[0],
      accounts[2],
      'Sponsoring application failed.'
    )
  })
  it('...applicant should withdraw the fund.', async () => {
    let balance = await app.balance
    console.log(balance)
    await new Promise((resolve) =>
      setTimeout(async () => {
        await app.withDrawFund({ from: accounts[1] })
        resolve()
      }, 1000 * 20)
    )
  })
})
