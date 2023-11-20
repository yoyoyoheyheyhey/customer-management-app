class AdminsController < ApplicationController
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = '管理者情報を作成しました'
      redirect_to @admin
    else
      flash[:alert] = '管理者情報の作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      flash[:notice] = '管理者情報を更新しました'
      redirect_to @admin
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy!
    @admin.icon.purge
    flash[:notice] = '管理者情報を削除しました'
    redirect_to admins_url
  end

    private

      def set_admin
        @admin = Admin.find(params[:id])
      end

      def admin_params
        params.require(:admin).permit(:name, :email, :password, :password_confirmation, :icon)
      end
end
