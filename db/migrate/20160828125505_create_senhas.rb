class CreateSenhas < ActiveRecord::Migration
  def change
    create_table :senhas do |t|
      t.string :Nome
      t.string :Url
      t.string :Senha

      t.timestamps null: false
    end
  end
end
