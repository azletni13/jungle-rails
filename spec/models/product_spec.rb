require 'rails_helper'

RSpec.describe Product, type: :model do
  # describe 'Validations' do
  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:price) }
  #   it { is_expected.to validate_presence_of(:quantity) }
  #   it { is_expected.to validate_presence_of(:category) }
  # end

  context 'Validations'
    before :each do
      @category = Category.create(name: 'Electronics')
    end

    it "should validate the presence of name" do
      @product = Product.create(
        name: "Amna's Product",
        price: 40,
        quantity: 10,
        category: @category
        )
      expect(@product).to be_valid
    end

    # it "should validate the presence of price" do
    #   @product = Product.create(
    #     name: "Amna's Product",
    #     price: 40,
    #     quantity: 10,
    #     category: @category
    #     )
    #   expect(@product).to be_valid
    # end

    # it "should validate the presence of quantity" do
    #   @product = Product.create(
    #     name: "Amna's Product",
    #     price: 40,
    #     quantity: 10,
    #     category: @category
    #     )
    #   expect(@product).to be_valid
    # end

    # it "should validate the presence of category" do
    #   @product = Product.create(
    #     name: "Amna's Product",
    #     price: 40,
    #     quantity: 10,
    #     category: @category
    #     )
    #   expect(@product).to be_valid
    # end


    it "should validate the absence of name" do
      @product = Product.create(
        name: nil,
        price: 40,
        quantity: 10,
        category: @category
        )
      expect(@product.errors.size).to eql(1)
    end

    it "should validate the absence of price" do
      @product = Product.create(
        name: "Amna's Product",
        price: nil,
        quantity: 10,
        category: @category
        )
      expect(@product.errors.size).to eql(3)
    end

    it "should validate the absence of quantity" do
      @product = Product.create(
        name: "Amna's Product",
        price: 40,
        quantity: nil,
        category: @category
        )
      expect(@product.errors.size).to eql(1)
    end

    it "should validate the absence of category" do
      @product = Product.create(
        name: "Amna's Product",
        price: 40,
        quantity: 10,
        category: nil
        )
      expect(@product.errors.size).to eql(1)
    end
end
