class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.order(:name)
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = 'メニューを作成しました'
      redirect_to @menu
    else
      flash[:alert] = 'メニューの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      flash[:notice] = 'メニューを更新しました'
      redirect_to @menu
    else
      flash[:alert] = 'メニューの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @menu.destroy
    flash[:notice] = 'メニューを更新しました'
    redirect_to menus_url
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :price)
  end
end
