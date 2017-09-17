class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.date :data_nascimento
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :plano_de_saude
      t.string :num_registro

      t.timestamps null: false
    end
  end
end
