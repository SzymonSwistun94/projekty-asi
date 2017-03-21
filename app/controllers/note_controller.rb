require 'securerandom'

class NoteController < ApplicationController
  def create
    if params.has_key?(:note)
      # visibility = if params[:note][:public] then 2 elsif params[:note][:perma] then 1 else 0 end
      note = Note.new(:title => params[:note][:name], :content => params[:note][:content], :permalink => SecureRandom.hex(16), :author => current_user)
      if note.save
        redirect_to('/main/list')
      else
        params[:note] = nil
        params << {:note_err => ''}
        render('/note/create')
      end
    else
      render('/note/create')
    end
  end

  def edit
  end

  def remove
  end

  def view
    redirect_to('main/list') unless params.has_key?[:permalink]
    @note = Note.find_by_permalink(params[:permalink])
    if @note.nil? or (@note.author != current_user and @note.visibility == 0)
      params << {:note_err => 'No such note'}
      redirect_to('main/list')
    end
  end
end
