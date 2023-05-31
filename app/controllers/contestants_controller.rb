class ContestantsController < ApplicationController
    def index
        @contestants = Contenstant.all
    end

    def show
        @contestant = Contestant.find(params[:id])
    end
    def new
        @contestant = Contestant.new
    end


 def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      redirect_to @contestant, notice: "Contestant was successfully created."
    else
      render :new
    end
  end

  def pick_quesition
    @contestant = Contestant.find(params[:id])
    @quesition = Quesition.find(params[:quesition_id])

    @picked_quesition = PickedQuesition.new(contestant: @contestant, quesition: @quesition)

    if @picked_quesition.save
      redirect_to @contestant, notice: "Quesition picked successfully."
    else
      redirect_to @contestant, alert: "Unable to pick the quesition."
    end
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name)
  end
end
