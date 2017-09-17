json.extract! medico, :id, :nome, :cpf, :email, :data_nascimento, :endereco, :bairro, :cidade, :estado, :crm, :especialidade, :local_trabalho, :created_at, :updated_at
json.url medico_url(medico, format: :json)
