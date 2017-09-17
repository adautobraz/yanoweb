class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :atendimentos, :paciente_id, :integer
    add_column :atendimentos, :medico_id, :integer
  end
end
