class DisponibilidadesController < ApplicationController
  before_action :set_medio, only: [:show, :edit, :update, :destroy]

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
    @disponibilidade = Disponibilidade.new(Disponibilidade_params)

    respond_to do |format|
      if @disponibilidade.save
        format.html { redirect_to @disponibilidade, notice: 'Disponibilidade was successfully created.' }
        format.json { render :show, status: :created, location: @disponibilidade }
      else
        format.html { render :new }
        format.json { render json: @disponibilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Disponibilidades/1
  # PATCH/PUT /Disponibilidades/1.json
  def update
    respond_to do |format|
      if @disponibilidade.update(Disponibilidade_params)
        format.html { redirect_to @disponibilidade, notice: 'Disponibilidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @disponibilidade }
      else
        format.html { render :edit }
        format.json { render json: @disponibilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Disponibilidades/1
  # DELETE /Disponibilidades/1.json
  def destroy
    @disponibilidade.destroy
    respond_to do |format|
      format.html { redirect_to Disponibilidades_url, notice: 'Disponibilidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Disponibilidade
      @disponibilidade = Disponibilidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilidade_params
      params.require(:disponibilidade).permit(:date, :horario_inicial, :horario_final)
    end
end
