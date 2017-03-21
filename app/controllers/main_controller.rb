class MainController < ApplicationController

  def index
  end

  def list

    if user_signed_in?
      @notes = Note.all.find_all{ |n| n.visibility == 2 or n.author == current_user }
    else
      @notes = Note.find_by_visibility(2)
    end

  end
end
