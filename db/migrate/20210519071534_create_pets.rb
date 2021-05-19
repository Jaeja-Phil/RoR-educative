class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.text :description

      t.timestamps
    end
  end
end
