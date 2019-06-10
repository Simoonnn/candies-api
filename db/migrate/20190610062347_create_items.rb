class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.numeric :price
      t.string :img_digest

      t.timestamps
    end
  end
end
