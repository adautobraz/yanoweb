class AddFieldsToDisponibilidade < ActiveRecord::Migration
  def change
    add_column :disponibilidades, :medico_id, :integer
  end
end
