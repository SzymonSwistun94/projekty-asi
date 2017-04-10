class MainController < ApplicationController

  def index
  end

  def list

    if user_signed_in?
      @user = current_user

      @notes = if @user.id == 1 then Note.all else Note.where( 'visibility = 2 or user_id = ?', current_user.id) end
    else
      @notes = Note.where(visibility: 2)
    end

  end

end
