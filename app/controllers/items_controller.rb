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
    phrase = params['phrase'].to_s || false
    sort = params['sort'] == '' ? false : params['sort']
    if sort
      sort = sort.split('SEP')
      puts sort[0]
      puts sort[1]
      puts sort.class
      if (sort[0] == 'name' || sort[0] == 'price') || (sort[1] == 'desc' || sort[1] == 'asc')
        key = sort[0]
        order = sort[1]
      else
        sort = false
      end

    end
    if limit > 30 || limit < 3
      limit = 5
    end
    if page < 1
      page = 1
    end
    if (total / limit < page - 1)
      offset = (total / limit).round - 1
    end
    if phrase != ''
      phrase = '%' + phrase + '%'
      items = Item.where('name LIKE :phrase', { phrase: phrase }).limit(limit)
    else
      items = Item.offset(offset).limit(limit)
    end
    if sort
      body = items.order(key => order)
    else
      body = items.order(id: :desc)
    end
    render json: {response: body}
  end
  def specific
    array = params['array']
    body = { items: Item.where(id: array)}
    render json: body
  end
end
