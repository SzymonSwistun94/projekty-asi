class Note < ApplicationRecord

  belongs_to :user

  def accessible?(current_user = nil)
    not current_user.nil? and (visibility != 2 or current_user != user_id or current_user != 0)
  end

end
