class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.date :data_nascimento
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :crm
      t.string :especialidade
      t.string :local_trabalho

      t.timestamps null: false
    end
  end
end
