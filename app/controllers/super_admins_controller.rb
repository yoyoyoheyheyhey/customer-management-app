class SuperAdminsController < ApplicationController
  before_action :if_not_super_admin
  before_action :set_admin, only: %i[show edit update destroy]

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'アカウントを作成しました'
      redirect_to @admin
    else
      flash[:alert] = 'アカウントの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    updated_params = admin_params
    if !(current_admin.admin?) && updated_params[:password].blank?
      updated_params.delete(:password)
      updated_params.delete(:password_confirmation)
    end
    
    if @admin.update(updated_params)
      flash[:notice] = 'アカウント情報を更新しました'
      redirect_to super_admin_path(@admin)
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy!
    flash[:notice] = 'アカウントを削除しました'
    redirect_to admins_url
  end
  
  private

    def if_not_super_admin
      redirect_to root_path unless current_admin.admin?
    end
    
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end