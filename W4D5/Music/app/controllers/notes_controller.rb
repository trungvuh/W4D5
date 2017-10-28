class NotesController < ApplicationController
  before_action :require_logged_in

  def index
    @notes = Note.all
    render :index
  end

  def show
    @note = Note.find_by(id: params[:id])
    render :show
  end

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to note_url(@note)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])

    if @note
      render :edit
    else
      flash[:errors] = ['Cant edit this note']
      redirect_to note_url(params[:id])
    end
  end

  def update
    @note = Note.find_by(id: params[:id])

    if @note.update_attributes(note_params)
      redirect_to note_url(@note)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])

    if @note.destroy
      render :destroy
    else
      flash[:errors] = ['Cant destroy this note']
      redirect_to note_url(params[:id])
    end
  end


  private

  def note_params
    params.require(:note).permit(:track_id, :user_id, :content)
  end

end
