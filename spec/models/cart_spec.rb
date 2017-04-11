require 'rails_helper'

describe 'Cart' do
  describe '.total_price' do
    it 'returns the total prcie for all escapes in the cart' do
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
  end
end
