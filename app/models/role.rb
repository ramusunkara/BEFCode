class Role < ActiveRecord::Base
  belongs_to :person
  belongs_to :tag
end
