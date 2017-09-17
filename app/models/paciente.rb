class Paciente < ActiveRecord::Base
    has_many :atendimentos
    has_many :medicos, :through => :atendimentos
end
