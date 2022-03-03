class User < ApplicationRecord
  validates :name, presence: true

  has_many(
    :enrollments,
    class_name: 'Enrollment',
    foreign_key: :student_id,
    primary_key: :id
  )

  has_many :courses_instructing,
    class_name: 'Course',
    foreign_key: :instructor_id,
    primary_key: :id
  

  has_many :enrolled_courses, 
    through: :enrollments, 
    source: :course
end
