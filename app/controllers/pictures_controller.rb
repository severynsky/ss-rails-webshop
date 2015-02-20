class PicturesController < ApplicationController

  def destroy
    @picture = Picture.find(params[:id]).destroy
    respond_to do |format|
      format.js {render 'delete_image'}
    end
  end

end
