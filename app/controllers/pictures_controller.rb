class PicturesController < ApplicationController

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    # binding.pry
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js {render 'delete_image'}
    end
  end

end
