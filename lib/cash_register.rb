class CashRegister
    attr_accessor :total, :employee_discount, :items, :last_transaction_amount

    def initialize(employee_discount = nil)
      @total = 0
      @employee_discount = employee_discount
      @items = []
      @last_transaction_amount = 0
    end

    def add_item(title, price, quantity = 1)
      @last_transaction_amount = price * quantity
      @total += @last_transaction_amount
      quantity.times { @items << title }
    end

    def apply_discount
      if @employee_discount
        discount = @total * (@employee_discount / 100.0)
        @total -= discount
        "After the discount, the total comes to $#{@total.to_i}"
      else
        "There is no discount to apply."
      end
    end

    def void_last_transaction
      @total -= @last_transaction_amount
    end
  end
