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


    it "is not valid without a name"
    it "is not valid without a price"
    it "is not valid without a quantity"
    it "is not valid without a categrory"
  end
end
