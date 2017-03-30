class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes.for_student(student)
    '%.2f' % (notes.present? ? notes.average(:value) : 0)
  end

  def bday_decorated
    bday.strftime("%Y-%m_%d") if bday.present?
  end
end
