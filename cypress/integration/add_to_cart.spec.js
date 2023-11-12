describe('add to cart', () => {

  it('visits home page', () => {
    cy.visit('/');
  });

  it('confirms cart is empty', () => {
    cy.contains('My Cart (0)');
  });

  it('adds product to cart', () => {
    cy.contains('button', 'Add').click({ force: true });
  });

  it('confirms cart has one product', () => {
    cy.contains('My Cart (1)');
  });

});