class ContestantsController < ApplicationController
    def index
        @contestants = Contestant.all
    end

    def show
        @contestant = Contestant.find(params[:id])
    end
    def new
        @quizo = Quizo.find(params[:quizo_id])
        @contestant = @quizo.contestants.build
    end

    def create
        @quizo = Quizo.find(params[:quizo_id])
        @contestant = @quizo.contestants.build(contestant_params)
      
        if @contestant.save
          redirect_to @quizo, notice: "Contestant created successfully."
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
