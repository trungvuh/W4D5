class TracksController < ApplicationController
  before_action :require_logged_in

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])

    if @track
      render :edit
    else
      flash[:errors] = ['Cant edit this track']
      redirect_to track_url(params[:id])
    end
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])

    if @track.destroy
      render :destroy
    else
      flash[:errors] = ['Cant destroy this track']
      redirect_to track_url(params[:id])
    end
  end


  private

  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :album_id, :t_type)
  end
end
