require 'spec_helper'

feature 'User checks student subjects' do
  let(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment) { create :payment, student: student, deadline: Time.now.end_of_month, paid_at: Time.now.beginning_of_month }
  let!(:payment_2) { create :payment, student: student, deadline: (Time.now.end_of_month - 1.month), paid_at: (Time.now.beginning_of_month - 1.month), price: 50 }
  let!(:payment_3) { create :payment, student: student, deadline: (Time.now.end_of_month - 1.month), paid_at: (Time.now.beginning_of_month - 1.month), price: 50 }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    find(:xpath, "//a[@title='show all payments']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments » Jan Nowak'
    end

    expect(page).to have_content '$50.00'
    expect(page).to have_content((Time.now.end_of_month - 1.month).strftime('%Y-%m-%d'))
  end
end
