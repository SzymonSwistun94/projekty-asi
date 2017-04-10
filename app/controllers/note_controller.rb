require 'securerandom'

class NoteController < ApplicationController
  def create
    if params.has_key?(:note)
      # visibility = if params[:note][:public] then 2 elsif params[:note][:perma] then 1 else 0 end
      puts params
      visibility = if params.has_key? 'commit_0' then 0 elsif params.has_key? 'commit_1' then 1 else 2 end
      note = Note.new(:title => params[:note][:name], :desc => params['note']['desc'], :content => params[:note][:content], :permalink => SecureRandom.hex(8), :visibility => visibility)
      note.user = current_user
      if note.save
        redirect_to('/main/list')
      else
        params[:note] = nil
        @err = 'Not saved'
        render('/note/create')
      end
    else
      render('/note/create')
    end
  end

  def edit
    @id = params['Id']
    @note = Note.find_by :id => @id
    puts @id
    puts @note
    # if %w(commit_0, commit_1, commit_2).all?{ |p| params.keys.include? p }
    if params.has_key? 'commit_0' or params.has_key? 'commit_1' or params.has_key? 'commit_2'
      puts params
      @note.title = params['note']['title']
      @note.desc = params['note']['desc']
      @note.content = params['note']['content']
      @note.visibility = if params.has_key? 'commit_0' then 0 elsif params.has_key? 'commit_1' then 1 else 2 end
      @note.save
      redirect_to(:controller => :main, :action => :list)
    else
      render('/note/edit')
    end
  end

  def remove
    @id = params['Id']
    if params.has_key? 'confirm' or params.has_key? 'no_confirm'
      if params.has_key? 'confirm'
        note = Note.find_by id: @id
        note.destroy unless note.nil?
      end
      redirect_to(controller: :main, action: :list)
    else
      render('/note/remove')
    end

  end

  def view
    redirect_to controller: :main, view: :list unless params.has_key? :permalink
    @note = Note.find_by_permalink(params[:permalink])
    if @note.nil? or @note.accessible?
      redirect_to controller: :main, view: :list
    else
      # options = {:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode}
      options = {}
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      @content = markdown.render(@note.content)
    end
  end
end
