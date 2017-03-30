class Payment < ActiveRecord::Base
  belongs_to :student
  scope :last_payment, -> { where('paid_at is not null').order(paid_at: :desc) }
end
