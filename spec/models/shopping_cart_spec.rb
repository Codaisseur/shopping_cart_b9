require 'rails_helper'

describe ShoppingCart do
  let(:cart) { ShoppingCart.new }
  let(:product) { Product.new(name: "Laptop", price: 800, stock: 4) }

  it { expect(cart.products.size).to be 0 }

  describe "#add_product" do
    it "only accepts products" do
      expect { cart.add_product("garbage") }.to raise_error(ArgumentError)
      expect { cart.add_product(product) }.not_to raise_error
    end

    it "adds the product to the @products" do
      cart.add_product(product)
      expect { cart.products.to include(product) }
    end
  end
end
