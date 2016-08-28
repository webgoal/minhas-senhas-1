class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |p|
      p.string :url
      p.string :user
      p.string :password

      #t.timestamps null: false
    end
  end
end
