class QuesitionsController < ApplicationController
  before_action :set_quesition, only: %i[ show edit update destroy ]

  # GET /quesitions or /quesitions.json
  def index
    @quesitions = Quesition.all
    @contestant = Contestant.new
    @contestant = Contestant.find(params[:contestant_id])
    @quizo = Quizo.find(params[:quizo_id])
  end
  

  # GET /quesitions/1 or /quesitions/1.json
  def show
    @quizo = Quizo.find(params[:quizo_id])
    @contestant = Contestant.find(params[:contestant_id])
    @quesition = Quesition.find(params[:id])
    @contestant_answer = ContestantAnswer.find_by(contestant: @contestant, quesition: @quesition)
    @submission = Submission.new(quizo: @quizo, contestant: @contestant, quesition: @quesition)
  end
  
  
  
  

  # GET /quesitions/new
  def new
    @quesition = Quesition.new
  end

  # GET /quesitions/1/edit
  def edit
  end

  # POST /quesitions or /quesitions.json
  def create
    @quesition = Quesition.new(quesition_params)

    respond_to do |format|
      if @quesition.save
        format.html { redirect_to questions_index_path, notice: "Quesition was successfully created." }
        format.json { render :show, status: :created, location: @quesition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quesition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quesitions/1 or /quesitions/1.json
  def update
    respond_to do |format|
      if @quesition.update(quesition_params)
        format.html { redirect_to quesition_url(@quesition), notice: "Quesition was successfully updated." }
        format.json { render :show, status: :ok, location: @quesition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quesition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quesitions/1 or /quesitions/1.json
  def destroy
    @quesition.destroy

    respond_to do |format|
      format.html { redirect_to quesitions_url, notice: "Quesition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quesition
      @quesition = Quesition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quesition_params
      params.require(:quesition).permit(:quizo_id, :content, :answer1, :answer2, :answer3, :answer4, :correct_answer, :image)
    end
end
