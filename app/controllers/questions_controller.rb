class QuestionsController < ApplicationController
  before_action :authorize, only: [:new]

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been added!"
      redirect_to session_path(@user)
    else
      render :new
    end
  end

private
  def question_params
    params.require(:question).permit(:question)
  end

end
