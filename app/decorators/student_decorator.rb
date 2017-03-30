class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    '%.2f' % (subject_item.subject_item_notes.present? ? subject_item.subject_item_notes.average(:value) : 0)
  end

  def bday_decorated
    bday.strftime("%Y-%m_%d") if bday.present?
  end
end
