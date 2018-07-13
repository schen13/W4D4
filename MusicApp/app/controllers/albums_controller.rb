class AlbumsController < ApplicationController

  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(params[:album][:band_id])
    else
      flash[:errors] = ['Invalid album entry.']
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      render :show
    else
      flash[:errors] = ['Album update failed.']
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    Album.destroy(@album.id) if @album
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end
end
