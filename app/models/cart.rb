class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(escape_id)
    contents[escape_id.to_s] ||= 0
    contents[escape_id.to_s] +=1
  end

  def find_escapes
    cart_items = []
    contents.each do |id, count|
      cart_items << Escape.find(id.to_i)
    end
    cart_items
  end

  def total_price
    cart_prices = []
    contents.each do |id, count|
      cart_prices << Escape.find(id.to_i).price * count
    end
    sprintf('%.2f', cart_prices.reduce(:+))
  end

  def remove_item(item_id)
    contents.delete(item_id)
  end

  def quantity(item_id)
    contents[item_id.to_s]
  end

  def subtotal(escape)
    sprintf('%.2f', (escape.price * quantity(escape.id)))
  end

  def decrease_quantity(item_id)
    if contents[item_id.to_s] == 1
      remove_item(item_id.to_s)
    else
      contents[item_id.to_s] -= 1
    end
  end

  def increase_quantity(item_id)
    contents[item_id.to_s] += 1
  end

  def cart_count
   if  contents.empty?
      return 0
   else
    item_count = []
    contents.map do |id, count|
      item_count << count
    end
    item_count.reduce(:+)
   end
  end

end
