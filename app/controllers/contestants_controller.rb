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
    
    def quesitions
      @quizo = Quizo.find(params[:quizo_id])
      @contestant = Contestant.find(params[:contestant_id])
      @quesitions = @quizo.quesitions.available
    end
    
    def create
      @quizo = Quizo.find(params[:quizo_id])
      @contestant = @quizo.contestants.build(contestant_params)
    
      if @contestant.save
        redirect_to quizo_path(@quizo), notice: "Contestant added successfully"
      else
        render :new
      end
    end
      def leaderboard
        @contestants = Contestant.all.order(points: :desc)
      end
      def edit
        @quizo = Quizo.find(params[:quizo_id])
        @contestant = Contestant.find(params[:id])
      end
      
    
      def update
        @quizo = Quizo.find(params[:quizo_id])
        @contestant = Contestant.find(params[:id])
        
        if @contestant.update(contestant_params)
          redirect_to quizo_path(@quizo), notice: "Contestant updated successfully."


        else
          render :edit
        end
      end
      def pick_quesition
        @contestant = Contestant.find(params[:id])
        @quesition = Quesition.find(params[:quesition_id])
      
        @contestant_answer = ContestantAnswer.new(contestant: @contestant, quesition: @quesition)
      
        if @contestant_answer.save
          redirect_to @contestant, notice: "Question picked successfully."
        else
          redirect_to @contestant, alert: "Unable to pick the question."
        end
      end
      

  private

  def contestant_params
    params.require(:contestant).permit(:name, :quizo_id)
  end
end
