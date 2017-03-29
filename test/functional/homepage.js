Feature('homepage')

Scenario('see a cat image', (I) => {
  I.amOnPage('/')
  I.seeInTitle('example project')
  I.seeElement(`//img[@alt='pikachu']`)
})
