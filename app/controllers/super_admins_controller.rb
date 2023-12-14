class SuperAdminsController < ApplicationController
  before_action :if_not_super_admin
  before_action :set_admin, only: %i[show edit update discard destroy undiscard_admin]
  before_action :set_menu, only: :undiscard_menu
  before_action :set_customer, only: :undiscard_customer

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
    flash[:notice] = "#{@admin.name}を削除しました"
    redirect_to admins_url
  end

  def discard
    @admin.discard
    flash[:notice] = "#{@admin.name}をアーカイブしました"
    redirect_to admins_url
  end

  def discarded
    @q = Admin.discarded.ransack(params[:q])
    @admins = @q.result

    @q = Menu.discarded.ransack(params[:q])
    @menus = @q.result

    @q = Customer.discarded.ransack(params[:q])
    @customers = @q.result
  end

  def undiscard_admin
    @admin.undiscard
    flash[:notice] = "#{@admin.name}を復元しました"
    redirect_to admins_url
  end

  def undiscard_menu
    @menu.undiscard
    flash[:notice] = "#{@menu.name}を復元しました"
    redirect_to menus_url
  end

  def undiscard_customer
    @customer.undiscard
    flash[:notice] = "#{@customer.name}様を復元しました"
    redirect_to customers_url
  end
  
  private

    def if_not_super_admin
      redirect_to root_path unless current_admin.admin?
    end
    
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end