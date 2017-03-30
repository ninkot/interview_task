class PaymentDecorator < Draper::Decorator
  def price_with_currency
    h.number_to_currency(payment.price)
  end
end
