class Admin::UsersController < Admin::AdminController

  def edit
    @user = current_user
  end


  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:success] = 'Your information was successfully updated'
      redirect_to edit_admin_users_path
    else
      flash[:error] = @user.errors.full_messages.join('<br/>')
      render :edit
    end
  end
end
