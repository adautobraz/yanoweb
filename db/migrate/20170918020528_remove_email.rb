class RemoveEmail < ActiveRecord::Migration
  def change
    remove_column :pacientes, :email
    remove_column :medicos, :email
  end
end
