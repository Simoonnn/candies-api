class ItemsController < ApplicationController
  def create
    name = params['name']
    description = params['description']
    price = params['price']
    Item.create(name: name, description: description, price: price)
  end
  def generate_digest
    name = params['name']
    if !Item.find_by(name: name)
      img_digest = Digest::MD5.hexdigest(name)
      render json: { success: 'true', digest: img_digest}
    else
      render json: { success: 'false' }
    end
  end
end
