class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.groups.includes(:user)
    @total_amounts = {}

    @categories.each do |category|
      @total_amounts[category.id] = category.entities.sum(:amount)
    end
    @total_expenditure = current_user.entities.sum(:amount)
    @incomes = current_user.incomes
    @total_income = @incomes.sum(:amount)
  end

  def new
    @category = current_user.groups.build
  end

  def create
    @category = current_user.groups.build(group_params)
    if @category.save
      redirect_to categories_path, notice: 'New Category created successfully.'
    else
      render :new
    end
  end

  def show
    @category = Group.find(params[:id])
    @transactions = @category.entities
    @total_amount = @category.entities.sum(:amount)
  end

  def edit
    @category = current_user.groups.find(params[:id])
  end

  def update
    @category = current_user.groups.find(params[:id])

    if @category.update(group_params)
      redirect_to categories_path, notice: 'Category updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @category = current_user.groups.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category item deleted successfully.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
