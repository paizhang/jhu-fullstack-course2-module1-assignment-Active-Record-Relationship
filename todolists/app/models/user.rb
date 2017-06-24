class User < ActiveRecord::Base
  has_one :profile;

  has_many :todo_lists, dependent: :destroy;    # Using plural names for has_many

  has_many :todo_items, through: :todo_lists, source: :todo_items
end
