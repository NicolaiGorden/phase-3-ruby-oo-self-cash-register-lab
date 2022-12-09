require "pry"

class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :item_prices, :last_transaction

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            items.push(title)
        end
        self.last_transaction = [title, price, quantity]
        self.total += price*quantity
    end

    def apply_discount()
        if @discount == nil
            "There is no discount to apply."
        else
            @total = total - total.to_f*(discount*0.01)
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def void_last_transaction()
        items.pop
        self.total -= last_transaction[1] * last_transaction[2]
    end
end

