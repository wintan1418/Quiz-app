class SubmissionsController < ApplicationController
    before_action :find_submission, only: [:show]


def create
  @quizo = Quizo.find(params[:quizo_id])
  @quesition = Quesition.find_by(id: params[:quesition_id])

  unless @quesition
    # Handle the case when the quesition is not found
    flash[:error] = "The requested question is not available."
    redirect_to error_path
    return
  end

  selected_answer_id = params[:submission][:selected_answer_id]
  contestant = Contestant.find(params[:submission][:contestant_id])
  score = (@quesition.correct_answer.to_i == selected_answer_id.to_i) ? 5 : 0
  @submission = contestant.submissions.build(
    quizo: @quizo,
    quesition: @quesition,
    score: score,
    selected_answer_id: selected_answer_id
  )

  if @submission.save
    redirect_to submission_path(@submission, quizo_id: @quizo.id, contestant_id: contestant.id, quesition_id: @quesition.id)
  else
    render :new
  end
end




    
    def new
      @quizo = Quizo.find(params[:quizo_id])
      @quesition = Quesition.find(params[:quesition_id])
      @contestant = Contestant.find(params[:contestant_id])
      @contestant_answer = ContestantAnswer.find_by(contestant: @contestant, quesition: @quesition)
      @submission = Submission.new(quizo: @quizo, quesition: @quesition)
    end
    
    
  
    def show
      @submission = Submission.find(params[:id])
      @contestant = @submission.contestant
      @quesition = @submission.quesition
      @selected_answer = @submission.selected_answer_id
      @score = @submission.score
      @quizo = @submission.quizo
    end
    
    
    private
    def calculate_score(contestant)
      correct_answers = 0
    
      contestant.contestant_answers.each do |contestant_answer|
        quesition = contestant_answer.quesition
        correct_answers += 1 if quesition.correct_answer == contestant_answer.answer_index
      end
    
      correct_answers * 5
    end

    def find_submission
      @submission = Submission.find(params[:id])
    end
  
    def submission_params
      params.require(:submission).permit(:quizo_id, :contestant_id, :quesition_id, :score, :selected_answer_id)
    end
  end
  
