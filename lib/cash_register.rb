
class CashRegister 
  
  attr_accessor :items, :total, :discount, :latest_price, :latest_qty 
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, qty = 1)
    @latest_price = price 
    @latest_qty = qty 
    qty.times do 
      @total += price 
      @items << item
    end 
  end 
  
  def total 
    @total 
  end 
  
  def apply_discount 
    if @discount == 0 
      "There is no discount to apply."
    else 
      @total = @total.to_f * (1 - @discount.to_f/100)
      "After the discount, the total comes to $#{@total.to_i}."
    end 
  end 
  
  def items 
    @items
  end 
  
  def void_last_transaction
    @latest_qty.times do 
      @items.pop
      @total -= @latest_price
    end 
    @total = 0 if @items.length == 0 
  end 
  
  
end 
