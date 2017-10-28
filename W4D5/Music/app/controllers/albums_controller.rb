class AlbumsController < ApplicationController
  before_action :require_logged_in

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])

    if @album
      render :edit
    else
      flash[:errors] = ['Cant edit this album']
      redirect_to album_url(params[:id])
    end
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])

    if @album.destroy
      render :destroy
    else
      flash[:errors] = ['Cant destroy this album']
      redirect_to album_url(params[:id])
    end
  end


  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :style)
  end

end
