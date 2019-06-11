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
  def get
    limit = params['limit'].to_i
    total = Item.count
    page = params['page'].to_i
    if limit > 20 || limit < 3
      limit = 5
    end
    if page < 1
      page = 1
    end
    if (total / limit < page - 1)
      offset = (total / limit).round - 1
    end
    body = Item.offset(offset).limit(limit).order(id: :desc)
    render json: {response: body}
  end
end
