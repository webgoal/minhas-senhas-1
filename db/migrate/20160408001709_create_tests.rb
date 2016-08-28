class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |p|
      p.string :url
      p.string :user
      p.string :password

      #p.timestamps null: false
    end
  end
end
