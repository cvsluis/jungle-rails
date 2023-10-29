module ProductHelper

  def price_with_discount(price)
    price - (price * (current_sale.percent_off / 100.00))
  end

end
