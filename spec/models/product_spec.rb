require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "it saves a valid product" do 
      @category = Category.find_or_create_by! name: "name"
      @product = Product.new(name: "product_name", price_cents: 100, quantity: 1, category: @category)

      @product.save
      expect(@product).to be_valid
    end

    it "it doesn't save a not valid product without a name" do 
      @category = Category.find_or_create_by! name: "name"
      @product = Product.new(name: nil, price_cents: 100, quantity: 1, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "it doesn't save a not valid product without a price" do 
      @category = Category.find_or_create_by! name: "name"
      @product = Product.new(name: "product_name", price_cents: nil, quantity: 1, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "it doesn't save a not valid product without a quantity" do 
      @category = Category.find_or_create_by! name: "name"
      @product = Product.new(name: "product_name", price_cents: 100, quantity: nil, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "it doesn't save a not valid product without a category" do 
      @category = Category.find_or_create_by! name: "name"
      @product = Product.new(name: "product_name", price_cents: 100, quantity: 1, category: nil)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
