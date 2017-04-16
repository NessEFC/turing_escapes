class Admin::UsersController < Admin::BaseController
  #before_action :set_admin_user, only:   [:show,]
  def index
    #@users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @current_user.update_attributes(admin_user_params)
    if @current_user.save
      flash[:success] = "Account successfully updated"
      redirect_to admin_user_path(@current_user)
    else
      redirect_to edit_admin_user_path(@display_user)
    end
  end

  def admin_dash
    @user = current_user
  end

private
  def admin_user_params
    params.require(:user).permit(:username)
  end

  # def set_admin_user
  #   @display_user = User.find(params[:id])
  # end
end
