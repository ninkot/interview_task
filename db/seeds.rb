require 'faker'
puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
['Math', 'Biology', 'Music', 'Science', 'Chemistry'].each do |x|
  SubjectItem.create!(
    title: x,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bday: Faker::Date.birthday(12, 40)
  )
end


subject_items = SubjectItem.all
Student.all.each do |student|
  student.subject_items << subject_items.sample(rand(1..4))
end

students = Student.all
5.times do |m|
  students.each do |student|
    Payment.create!(
      student: student,
      deadline: (Time.now - m.months).end_of_month,
      paid_at: [
        nil,
        (Time.now - m.months - rand(1..10).days),
        (Time.now - m.months - rand(1..10).days)
      ].sample,
      price: 50
    )
  end
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
