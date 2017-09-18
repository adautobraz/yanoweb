class DisponibilidadesController < ApplicationController
  before_action :set_disponibilidade, only: [:show, :edit, :update, :destroy]

  # GET /@disponibilidades
  # GET /Disponibilidades.json
  def index
    @disponibilidades = Disponibilidade.all
  end

  # GET /Disponibilidades/1
  # GET /Disponibilidades/1.json
  def show
  end

  # GET /Disponibilidades/new
  def new
    @disponibilidade = Disponibilidade.new
  end

  # GET /Disponibilidades/1/edit
  def edit
  end

  # POST /Disponibilidades
  # POST /Disponibilidades.json
  def create
    @disponibilidade = Disponibilidade.new(disponibilidade_params)
    @medico = Medico.find(disponibilidade_params[:medico_id])

    respond_to do |format|
      if @disponibilidade.save
        format.html { redirect_to @medico, notice: 'Disponibilidade was successfully created.' }
        format.json { render :show, status: :created, location: @disponibilidade }
      else
        format.html { redirect_to @medico, notice: 'Disponibilidade incompleta' }
        format.json { render json: @disponibilidade.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /Disponibilidades/1
  # DELETE /Disponibilidades/1.json
  def destroy
    @medico = Medico.find(@disponibilidade.medico_id)
    @disponibilidade.destroy
    respond_to do |format|
      format.html { redirect_to @medico, notice: 'Disponibilidade retirada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disponibilidade
      @disponibilidade = Disponibilidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilidade_params
      params.require(:disponibilidade).permit(:date, :horario_inicial, :horario_final, :medico_id)
    end
end
