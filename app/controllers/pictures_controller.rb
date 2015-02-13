class PicturesController < ApplicationController

  def delete_image
    @picture = Picture.find(params[:image_id])
    @picture.destroy
    # binding.pry
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js {render 'delete_image'}
    end
  end

end
