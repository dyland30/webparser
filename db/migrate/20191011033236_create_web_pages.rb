class CreateWebPages < ActiveRecord::Migration[6.0]
  def change
    create_table :web_pages do |t|
      t.string :surl
      t.string :title

      t.timestamps
    end
  end
end
