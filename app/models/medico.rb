class Medico < ActiveRecord::Base
    has_many :atendimentos
    has_many :disponibilidades
    has_many :pacientes, :through => :atendimentos
end
