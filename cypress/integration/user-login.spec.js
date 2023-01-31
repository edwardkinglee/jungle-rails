describe('User Login', () => {

  it('should visit the homepage', () => {
    cy.visit('localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Visit sign up page", () => {
    cy.visit('localhost:3000/signup')
  });

  it("Fill out sign up fields", () => {
    cy.get('#user_first_name').type('Edward');
    cy.get('#user_last_name').type('Lee');
    cy.get('#user_email').type('test@test.com');
    cy.get('#user_password').type('password');
    cy.get('#user_password_confirmation').type('password');
  });

  it("Click on submit button on Sign Up page", () => {
    cy.get('input[name="commit"]').click()
  });

  it("It redirects back to the homepage", () => {
    cy.contains('Where you can find any plants!')
  });

  it("can click on the Logout in the navbar", () => {
    cy.get(".navbar").contains('Logout').click()
  });

  it("can click on the Login in the navbar", () => {
    cy.get(".navbar").contains('Login').click()
  });

  it("Fill out Login fields", () => {
    cy.get('#email').type('test@test.com');
    cy.get('#password').type('password');  
  });

  it("click submit to Login", () => {
    cy.get('input[name="commit"]').click()
  });

  it("It redirects back to the homepage", () => {
    cy.contains('Where you can find any plants!')
  });
})