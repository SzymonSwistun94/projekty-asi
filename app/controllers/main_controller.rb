class MainController < ApplicationController

  def index
  end

  def list

    if user_signed_in?
      # puts "#{current_user.email} signed in - id: #{current_user.id}"
      @user = current_user

      @notes = if @user.id == 1 then Note.all else Note.where( 'visibility = 2 or user_id = ?', current_user.id) end
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
