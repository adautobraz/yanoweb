class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.boolean :particular
      t.date :data
      t.time :horario

      t.timestamps null: false
    end
  end
end
