require 'rails_helper'

describe 'Cart' do
  describe '.total_price' do
    it 'returns the total price for all escapes in the cart' do
      escape_1, escape_2  = create_list(:escape, 2)  
      cart = Cart.new({escape_1.id.to_s => 1})
      cart.add_item(escape_1.id)
       
      expected = sprintf('%.2f', escape_1.price + escape_2.price)

      expect(cart.total_price).to eq(expected.to_s)
    end

    it 'it finds all escapes in the cart' do
      escape_1, escape_2  = create_list(:escape, 2)
      cart = Cart.new({escape_1.id.to_s => 1})
      cart.add_item(escape_2.id)
      
      expected = cart.find_escapes
      expect(expected.count).to eq(2)
      expect(expected.first).to be_a(Escape)
    end

    it 'it deletes escape from the cart' do
      escape_1 = create(:escape)
      cart = Cart.new({escape_1.id.to_s => 1})
      
      cart.remove_item(escape_1.id.to_s)
      expected = cart.contents
      expect(expected.count).to eq(0)
    end

    it 'it returns subtotal price all one kind escapes from the cart' do
      escape_1 = create(:escape)
      cart = Cart.new({escape_1.id.to_s => 3})
      
     expected = sprintf('%.2f', (escape_1.price * 3)).to_s
      expect(expected).to eq(cart.subtotal(escape_1))
    end

     it 'it returns quantity of particular escape in the cart' do
      escape_1 = create(:escape)
      cart = Cart.new({escape_1.id.to_s => 3})
      
      expect(cart.quantity(escape_1.id)).to eq(3)
    end

    it 'it returns decreased quantity of particular escape in the cart' do
      escape_1 = create(:escape)
      cart = Cart.new({escape_1.id.to_s => 3})
      
      cart.decrease_quantity(escape_1.id)
      expect(cart.quantity(escape_1.id)).to eq(2)
    end

    it 'it can count total count of escapes in the cart' do
      escape_1, escape_2  = create_list(:escape, 2)
      cart = Cart.new({escape_1.id.to_s => 1})
      cart.add_item(escape_2.id)
      
      expected = cart.cart_count
      expect(expected).to eq(2)
    end
  end
end
