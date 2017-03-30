require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :deadline }
    it { should have_db_column :paid_at }
    it { should have_db_column :price }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
