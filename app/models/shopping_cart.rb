class ShoppingCart
  attr_reader :products

  def initialize(session = {})
    @session = session
    session_lines = session[:shopping_cart] || []
    @order_lines = session_lines.map do |line|
      # Create new OrderLine instances from each Hash in the
      # session storage
      OrderLine.from_hash(line)
    end
  end

  def add_product(product, amount = 1)
    raise ArgumentError.new("Not a product") unless product.is_a?(Product)

    if already_ordered?(product)
      update_line(product, amount)
    else
      @order_lines.push OrderLine.new(product, amount)
      store!
    end

    return true
  end

  def remove_product(product, amount = 1)
    return false unless already_ordered?(product)

    @order_lines.select! do |line|
      next if line.product.id != product.id

      line.amount -= amount
      amount > 0 # Remove the line if the amount is 0 or less
    end

    return true
  end

  def already_ordered?(product)
    @order_lines.map(&:product).map(&:id).include?(product.id)
  end

  def update_line(product, amount)
    return false unless already_ordered?(product)

    @order_lines.each do |line|
      if line.product.id == product.id
        line.amount += amount
      end
    end

    store!

    return true
  end

  def store!
    @session[:shopping_cart] = @order_lines
  end
end
