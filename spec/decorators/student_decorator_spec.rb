require 'rails_helper'

describe StudentDecorator do
  let(:teacher) { create :teacher, first_name: 'John', last_name: 'Smith' }
  let(:student) { create :student, first_name: 'John', last_name: 'Smith' }
  let(:subject_item) { create :subject_item, teacher: teacher }
  let(:second_subject_item) { create :subject_item }
  let!(:note_1) { create :subject_item_note, value: 5, student: student, subject_item: second_subject_item }
  let!(:note_2) { create :subject_item_note, value: 4, student: student, subject_item: second_subject_item }


  describe "#full_name" do
    subject { student.decorate.full_name }
    it { is_expected.to eq 'John Smith' }
  end

  describe "#avg_notes" do
    describe "when student doesn't have notes assigned" do
      subject { student.decorate.avg_notes(subject_item) }

      it "returns 0.00" do
        is_expected.to eq '0.00'
      end
    end

    describe 'when student has notes assigned' do
      subject { student.decorate.avg_notes(second_subject_item) }

      it 'calculates avg of student notes' do
        is_expected.to eq '4.50'
      end
    end
  end

  describe "#current_payment_paid" do
    describe "when user has paid in current month" do
      let!(:payment_in_current_month) { create :payment, student: student, deadline: Time.now.end_of_month, paid_at: Time.now }
      subject { student.decorate.current_payment_paid }

      it 'displays check icon' do
        is_expected.to eq '<i class="fa fa-check"></i>'
      end
    end

    describe "when user hasn't paid in current month" do
      let!(:payment_in_current_month) { create :payment, student: student, deadline: Time.now.end_of_month }
      let!(:payment_in_current_month) { create :payment, student: student, deadline: Time.now.beginning_of_month, paid_at: (Time.now - 1.month) }
      subject { student.decorate.current_payment_paid }

      it 'displays times icon' do
        is_expected.to eq '<i class="fa fa-times"></i>'
      end
    end
  end
end
