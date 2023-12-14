class AdminsController < ApplicationController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @q = Admin.kept.ransack(params[:q])
    @admins = @q.result
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
  end

  def update    
    if @admin.update(admin_params)
      flash[:notice] = 'アカウント情報を更新しました'
      redirect_to @admin
    else
      render :edit
    end
  end

  private
  
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
