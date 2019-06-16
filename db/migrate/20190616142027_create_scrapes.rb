class CreateScrapes < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapes do |t|
      t.string :url

      t.timestamps
    end
  end
end
