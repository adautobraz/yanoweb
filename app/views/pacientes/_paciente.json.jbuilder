json.extract! paciente, :id, :nome, :cpf, :email, :data_nascimento, :endereco, :bairro, :cidade, :estado, :plano_de_saude, :num_registro, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
