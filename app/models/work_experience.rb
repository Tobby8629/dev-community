class WorkExperience < ApplicationRecord
  belongs_to :user
  EMPLOYMENT_TYPE = [
    "Part time",
    "Full time",
    "Intern", 
    "Trainee",
    "Self-employed",
    "Freelance",
  ].freeze
  
  LOCATION_TYPE = [
    "Remote",
    "Hybrid",
    "Onsite"
  ].freeze
  
  # Validation for presence and inclusion
  validates :start_date, :job_title, :location, :company, presence: true
  validates :employment_type, presence: true, inclusion: { in: EMPLOYMENT_TYPE, message: "is not a valid employment type" }
  validates :location_type, presence: true, inclusion: { in: LOCATION_TYPE, message: "is not a valid location type" }
  
# Custom validations for specific conditions
validate :work_experience_last_date
validate :work_experience_blank
validate :end_date_less_than_start_date, if: :current_not_working_here

  def work_experience_last_date
    if end_date.present? && currently_working
      errors.add(:end_date, 'must be blank if your are currently working in this compnay')
    end
  end

  def work_experience_blank
    if end_date.nil? && !currently_working
      errors.add(:end_date, "must be present if you are not currently working in this company")
    end
  end

  def current_not_working_here
    !currently_working
  end

  def end_date_less_than_start_date
    return if end_date.nil?
    if end_date < start_date
      errors.add(:end_date, "cannot not be less than the Starting date")
    end 
  end
end
