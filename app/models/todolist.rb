class Todolist < ActiveRecord::Base
  belongs_to :list
  acts_as_taggable
end
