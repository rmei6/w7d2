class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    if params.has_key?(:band_id)
      @album = Album.new
      render :new
    else
      redirect_to :new
    end
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_url
    else
      redirect_to :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      redirect_to albums_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:title,:year,:band_id,:live)
  end
end
