class Admin::UsersController < Admin::AdminController

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = 'User was successfully updated'
      redirect_to admin_root_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end
end
