class MainController < ApplicationController

  def index
  end

  def list

    if user_signed_in?
      @notes = Note.where( 'visibility = 2 or user_id = ? or user_id = 1', current_user.id)
    else
      @notes = Note.where(visibility: 2)
    end

  end

  def perma
    puts params
    @note = Note.where(id: params[:nId]).where('visibility = 2 or visibility = 1').first
    @err = if @note.nil?
             'Note not found'
           else
             nil
           end
    puts 'Note'
    puts @note
  end

end
