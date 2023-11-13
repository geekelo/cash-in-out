class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out @user # Assuming you are using Devise or similar for authentication
    redirect_to welcome_index_path, notice: 'Your account has been successfully deleted.'
  end
end
