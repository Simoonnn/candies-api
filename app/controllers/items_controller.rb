class ItemsController < ApplicationController
  def create

  end
  def generate_digest
    name = params['name']
    if !Item.find_by(name: name)
      img_digest = Digest::MD5.hexdigest(name)
      render json: { success: 'true', digest: img_digest}
    else
      render json: {success: 'false'}
    end
  end
end
