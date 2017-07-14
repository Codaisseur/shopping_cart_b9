class OrderLine
  attr_reader :product, :amount
  attr_accessor :added_at, :price

  def initialize(product, amount)
    @product = product
    @product_id = product.id
    @amount = amount
    @added_at = Time.now
    # Store the price at time of purchase
    @price = product.price
  end

  def to_hash
    {
      product_id: @product_id,
      amount: @amount,
      added_at: @added_at,
      price: @price
    }
  end

  def self.from_hash(line_hash)
    product = Product.where(id: line_hash[:product_id]).first
    return if product.nil?

    line = OrderLine.new(product, line_hash[:amount])
    line.added_at = line_hash[:added_at]
    line.price = line_hash[:price]
    line
  end
end
