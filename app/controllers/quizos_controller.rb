class QuizosController < ApplicationController
  before_action :set_quizo, only: %i[ show edit update destroy ]

  # GET /quizos or /quizos.json
  def index
    @quizos = Quizo.all
  end

  # GET /quizos/1 or /quizos/1.json
  def show
  end

  # GET /quizos/new
  def new
    @quizo = Quizo.new
    @quizo.quesitions.build
    @quizo.contestants.build
  end

  # GET /quizos/1/edit
  def edit
  end

  # POST /quizos or /quizos.json
  def create
    @quizo = Quizo.new(quizo_params)

    respond_to do |format|
      if @quizo.save
        format.html { redirect_to quizo_url(@quizo), notice: "Quizo was successfully created." }
        format.json { render :show, status: :created, location: @quizo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quizo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizos/1 or /quizos/1.json
  def update
    respond_to do |format|
      if @quizo.update(quizo_params)
        format.html { redirect_to quizo_url(@quizo), notice: "Quizo was successfully updated." }
        format.json { render :show, status: :ok, location: @quizo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quizo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizos/1 or /quizos/1.json
  def destroy
    @quizo.destroy

    respond_to do |format|
      format.html { redirect_to quizos_url, notice: "Quizo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizo
      @quizo = Quizo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quizo_params
      params.require(:quizo).permit(
        :title, 
        :image, 
        contestants_attributes: [
          :id,
          :_destroy,
          :name
        ],
        quesitions_attributes: [
          :id, 
          :_destroy, 
          :content, 
          :answer1, 
          :answer2, 
          :answer3, 
          :answer4, 
          :correct_answer, 
          :image
        ]
      )
    end
  end
