describe('users can navigate from the home page to the product details page by clicking on a product', () => {
  it('should visit the homepage', () => {
    cy.visit('localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("If you click on a product that product's details page loads", () => {
    cy.contains('Scented Blade').click()
    cy.get(".product-detail").should("be.visible")
  });
})