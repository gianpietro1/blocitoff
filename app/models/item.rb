class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope {order('created_at ASC')}

end
