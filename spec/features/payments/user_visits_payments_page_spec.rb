require 'spec_helper'

feature 'User visits teachers page'  do
  let!(:payment_1) { create :payment, deadline: Time.now.end_of_month, paid_at: Time.now.beginning_of_month }
  let!(:payment_2) { create :payment, deadline: Time.now.beginning_of_month, paid_at: Time.now - 1.month }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content payment_1.paid_at.strftime("%Y-%m-%d")
    expect(page).to have_content payment_2.paid_at.strftime("%Y-%m-%d")
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
