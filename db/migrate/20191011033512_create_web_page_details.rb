class CreateWebPageDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :web_page_details do |t|
      t.string :tag
      t.string :content
      t.integer :webPage_id

      t.timestamps
    end
  end
end
