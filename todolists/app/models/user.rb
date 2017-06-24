class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy;

  has_many :todo_lists, dependent: :destroy;    # Using plural names for has_many

  has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy

  validates :username, presence: true

  def get_completed_count
    count = 0;
    User.find_by(username: username).todo_items.all.each { |item|
      if item.completed == true
        count += 1;
      end
    }
    return count;
  end
end
