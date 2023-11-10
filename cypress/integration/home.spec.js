describe('jungle-rails app', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('visits home page', () => {
    cy.get('.title h1').should('have.text', "The Jungle");
  });

  it("displays products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("displays 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});