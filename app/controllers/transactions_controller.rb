# transactions_controller.rb
class TransactionsController < ApplicationController
  def new
    @category = Group.find(params[:category_id])
    @transaction = @category.entities.new
  end

  def edit
    @category = Group.find(params[:category_id])
    @transaction = @category.entities.find(params[:id])
  end

  def update
    @category = Group.find(params[:category_id])
    @transaction = @category.entities.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to category_path(@category), notice: 'Transaction updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @category = Group.find(params[:category_id])
    @transaction = @category.entities.find(params[:id])
    @transaction.destroy

    redirect_to category_path(@category), notice: 'Transaction deleted successfully.'
  end

  def create
    @category = Group.find(params[:category_id])
    @transaction = @category.entities.new(transaction_params)
    @transaction.user = current_user # Assuming you have a method to get the current user

    if @transaction.save
      redirect_to category_path(@category), notice: 'Transaction added successfully.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:name, :amount)
  end
end
