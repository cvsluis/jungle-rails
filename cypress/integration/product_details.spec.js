describe('product details', () => {

  it('can navigate from the home page to the product detail page by clicking on a product', () => {
    cy.visit('/');
    cy.get('article a').first().click();
    cy.contains('in stock');
  });

});