require 'spec_helper'

describe PaymentDecorator do
  let(:payment) { create :payment }
  describe '#price_with_currency' do
    subject { payment.decorate.price_with_currency }

    it 'displays price with currency' do
      is_expected.to eq '$50.00'
    end
  end
end
