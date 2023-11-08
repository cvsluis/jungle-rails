require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create(name: 'Flowers')
      @product = @category.products.create({ name: 'Tulip', quantity: 10, price: 5.99 })
    end

    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it "is not valid without a categrory" do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Category must exist", "Category can't be blank"])
    end

  end
end
