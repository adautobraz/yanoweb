class CreateDisponibilidades < ActiveRecord::Migration
  def change
    create_table :disponibilidades do |t|
      t.date :date
      t.time :horario_inicial
      t.time :horario_final

      t.timestamps null: false
    end
  end
end
