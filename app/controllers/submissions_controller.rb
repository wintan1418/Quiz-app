class SubmissionsController < ApplicationController
  before_action :find_quizo_submission, only: [:show]

  def create
    @quizo = Quizo.find(params[:quizo_id])

    user_answers = {}
    correct_answers = 0

    params.each do |key, value|
      next unless key.start_with?('quesition_')

      quesition_id = key.split('_').last.to_i
      selected_answer = value.to_i
      user_answers[quesition_id.to_s] = selected_answer
      quesition = Quesition.find(quesition_id)

      correct_answers += 1 if quesition.correct_answer == selected_answer
    end

    score = (correct_answers.to_f / @quizo.quesitions.count) * 100
    @submission = Submission.create(quizo: @quizo, user: current_user, score:, user_answers:)

    redirect_to quizo_submission_path(@quizo, @submission)
  end

  def show
    @quizo = @submission.quizo
  end

  private
  def find_quizo_submission
    @submission = Submission.find(params[:id])

  end

  def quizo_submission_params
    params.require(:submission).permit(:quizo_id, :user_id, :score, user_answers: {})
  end
end
