class QuestionsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
    @questions = Question.newest_first
    @todays_questions = Question.todays_questions.length
    @todays_answers = Answer.todays_answers.length
  end

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

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
  end

private
  def question_params
    params.require(:question).permit(:question, :user_id)
  end

end
