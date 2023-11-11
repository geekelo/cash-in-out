# app/controllers/incomes_controller.rb

class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @income = current_user.incomes.build
  end

  def clear_all
    current_user.incomes.destroy_all
    redirect_to categories_path, notice: 'All incomes cleared successfully.'
  end

  def create
    @income = current_user.incomes.build(income_params)

    if @income.save
      redirect_to categories_path, notice: 'Income added successfully.'
    else
      render :new
    end
  end

  private

  def income_params
    params.require(:income).permit(:amount)
  end
end
