class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes.for_student(student)
    format('%.2f', notes.present? ? notes.average(:value) : 0)
  end

  def bday_decorated
    bday.strftime('%Y-%m_%d') if bday.present?
  end

  def current_payment_paid
    last_payment = student.payments.last_payment.first
    if last_payment && last_payment.paid_at >= Time.now.beginning_of_month
      h.content_tag(:i, nil, class: 'fa fa-check')
    else
      h.content_tag(:i, nil, class: 'fa fa-times')
    end
  end
end
