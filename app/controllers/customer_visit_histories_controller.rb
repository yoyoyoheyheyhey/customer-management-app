class CustomerVisitHistoriesController < ApplicationController
  before_action :set_customer_visit_history, only: %i[edit update destroy]
  before_action :set_menus, only: %i[create update]
  before_action :fetch_customer, only: %i[create edit update destroy]

  def new
    @customer_visit_history = CustomerVisitHistory.new(
      params[:customer_id] ? { customer_id: params["customer_id"] } : {}
    )
    @customer_visit_history.selected_menu_snapshots.new
  end

  def create
    @customer_visit_history = CustomerVisitHistory.new(customer_visit_history_params)
    if @customer_visit_history.save
      @customer_visit_history.create_selected_menu_snapshot(@menus)
      flash[:notice] = '来店履歴を作成しました'
      redirect_to @customer
    else
      flash[:alert] = '来店履歴の作成に失敗しました'
      render :new
    end
  end
  
  def edit
  end

  def update
    if @customer_visit_history.update(customer_visit_history_params)
      @customer_visit_history.update_selected_menu_snapshot(@menus)
      flash[:notice] = '来店履歴を更新しました'
      redirect_to @customer
    else
      flash[:alert] = '来店履歴の更新に失敗しました'
      render :edit
    end
  end  

def destroy
    @customer_visit_history.destroy
		flash[:notice] = '来店履歴を削除しました'
    redirect_to @customer
  end

  private

    def set_customer_visit_history
      @customer_visit_history = CustomerVisitHistory.find(params[:id])
    end

    def set_menus
      @menus = Menu.where(id: params[:menu_ids])
    end

    def fetch_customer
      customer_id = params.dig(:customer_visit_history, :customer_id) || @customer_visit_history.customer_id
      @customer = Customer.find(customer_id)
    end

    def customer_visit_history_params
      params.require(:customer_visit_history).permit(:customer_id, :visit_datetime, selected_menu_snapshots: [:name_at_time, :price_at_time])
    end
end
