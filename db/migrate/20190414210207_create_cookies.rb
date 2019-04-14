class CreateCookies < ActiveRecord::Migration[5.2]
  def change
    create_table :cookies do |t|
      t.string :name
      t.string :description
    end
  end
end
