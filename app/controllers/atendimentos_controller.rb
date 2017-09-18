class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: [:show, :edit, :update, :destroy]

  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = Atendimento.all
  end

  # GET /atendimentos/1
  # GET /atendimentos/1.json
  def show
  end

  # GET /atendimentos/new
  def new
    @paciente = params[:paciente_id]
    @paciente_atendimento = Atendimento.new
    @disponibilidades = Disponibilidade.all
    @medicos = Medico.all
    @especialidades = [ "Acupuntura",   "Alergia e Imunologia", "Anestesiologia", "Angiologia", "Cancerologia", "Cardiologia",  "Cirurgia Cardiovascular",  "Cirurgia da Mão",  "Cirurgia de Cabeça e Pescoço", "Cirurgia do Aparelho Digestivo",  "Cirurgia Geral",  "Cirurgia Pediátrica",  "Cirurgia Plástica",  "Cirurgia Torácica",   "Cirurgia Vascular",  "Clínica Médica",  "Coloproctologia", "Dermatologia", "Endocrinologia e Metabologia", "Endoscopia",  "Gastroenterologia",  "Geriatria",  "Ginecologia",  "Hematologia e Hemoterapia",  "Homeopatia",  "Infectologia",  "Mastologia",  "Neurocirurgia",  "Neurologia",  "Nutrologia",  "Obstetrícia",  "Oftalmologia", "Ortopedia e Traumatologia","Otorrinolaringologia", "Patologia", "Pediatria", "Pneumologia", "Psiquiatria", "Radiologia", "Radioterapia",  "Reumatologia",  "Urologia"]
    @mapEspecialidade_Nome = Hash[@especialidades.collect { |v| [v, @medicos.where(especialidade: v).uniq.pluck(:nome)]}]
    @mapEspecialidadeNome_Datas = Hash[@disponibilidades.collect { |v| [v.medico.especialidade + v.medico.nome, @disponibilidades.where(medico_id: v.medico).uniq.pluck(:date)]}]
    @mapEspecialidadeNomeDatas_Horarios = Hash[@disponibilidades.collect { |v| [v.medico.especialidade + v.medico.nome + v.date.to_s, @disponibilidades.where(medico_id: v.medico, date: v.date).uniq.pluck(:horario_inicial)]}]
  end

  # GET /atendimentos/1/edit
  def edit
  end

  # POST /atendimentos
  # POST /atendimentos.json
  def create
    @medico = Medico.find_by(nome: params[:atendimento][:medico_id]) 
    @atendimento = Atendimento.new(medico_id: @medico.id, paciente_id: params[:paciente_id], particular: params[:particular], data: params[:atendimento][:data], horario: params[:atendimento][:horario] )
    @paciente = Paciente.find(params[:paciente_id])
    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to @paciente, notice: 'Atendimento was successfully created.' }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendimentos/1
  # PATCH/PUT /atendimentos/1.json

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @paciente = Paciente.find(@atendimento.paciente_id)
    @atendimento.destroy
    respond_to do |format|
      format.html { redirect_to @paciente, notice: 'Atendimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atendimento_params
      params.require(:atendimento).permit(:particular, :data, :horario, :paciente_id, :medico_id)
    end
end
