class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: {in: %w(male female)}  # %w(foo bar) is a shortcut for ["foo", "bar"]. Meaning it's a notation to write an array of strings separated by spaces instead of commas and without quotes around them.

  validate :first_name_or_second_name_not_null    # customized validation method should use validate instead of validates

  validate :male_has_first_name_sue

  def first_name_or_second_name_not_null
    if first_name == nil && last_name == nil
      errors.add(:first_name, "First name and second name cannot both be null")
    end
  end

  def male_has_first_name_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:gender, "anyone that is male cannot have the first_name 'Sue'")
    end
  end

  def self.get_all_profiles(min_year, max_year)
    profiles = Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).order(:birth_year);
    return profiles;
  end
end
