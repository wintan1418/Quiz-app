class QuizosController < ApplicationController
  before_action :set_quizo, only: %i[ show edit update destroy ]

  # GET /quizos or /quizos.json
  def index
    @quizos = Quizo.all
  end

  # GET /quizos/1 or /quizos/1.json
  def show
    @quizo = Quizo.find(params[:id])
    @contestants = @quizo.contestants.order(points: :desc)
    @contestant = Contestant.new
    @submission = Submission.new(quizo: @quizo) # Create a new submission for the quizo
  end
  
  # GET /quizos/new
  def new
    @quizo = Quizo.new
    @quizo.quesitions.build
    @quizo.contestants.build
  end

  def contestants_index
    @quizo = Quizo.find(params[:id])
    @contestants = @quizo.contestants
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

  def leaderboard
    @quizo = Quizo.find(params[:id])
    @leaderboard = Submission.where(quizo_id: @quizo.id)
                             .joins(:contestant)
                             .group('contestants.id')
                             .select('contestants.name, SUM(submissions.score) as total_score')
                             .order('total_score DESC')
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
    @quizo.submissions.each do |submission|
      submission.update(quesition_id: nil)
      submission.destroy
    end
    @quizo.destroy
    respond_to do |format|
      format.html { redirect_to quizos_url, notice: "Quizo was successfully destroyed." }
    end
  end
  
  
  # app/controllers/quizos_controller.rb
def remove_contestant
  @quizo = Quizo.find(params[:id])
  contestant = @quizo.contestants.find(params[:contestant_id])
  contestant.destroy
  redirect_to @quizo, notice: "Contestant removed successfully."
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
