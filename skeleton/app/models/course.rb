class Course < ApplicationRecord
  validates :name, :instructor_id, presence: true
  
  has_many(
    :enrollments,
    class_name: 'Enrollment',
    foreign_key: :course_id,
    primary_key: :id
  )
end
