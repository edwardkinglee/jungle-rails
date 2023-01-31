describe('users can click on the "Add to Cart" button on the home page', () => {
  it('Should visit the homepage', () => {
    cy.visit('localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Cart has 0 items in it", () => {
    cy.get(".end-0").should("contain.text", "My Cart (0)");
  });


  it("A user can click on the 'Add to Cart' button and count of cart goes up by 1", () => {
       cy.get('.products').contains('Add').click({force: true})
       cy.get(".end-0").should("contain.text", "My Cart (1)");
  });


})