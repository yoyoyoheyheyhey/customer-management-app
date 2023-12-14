class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy discard]
  before_action :set_customer_visit_history, only: :show

  def index
    @q = Customer.kept.ransack(params[:q])
    @customers = @q.result
  end

  def show
    @q = @customer.customer_visit_histories.preload(:selected_menu_snapshots).ransack(params[:q])
    @customer_visit_histories = @q.result
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
			flash[:notice] = '顧客情報を作成しました'
      redirect_to @customer
    else
			flash[:alert] = '顧客情報の作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
			flash[:notice] = '顧客情報を更新しました'
      redirect_to @customer
    else
			flash[:alert] = '顧客情報の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @customer.destroy
		flash[:notice] = "#{@customer.name}を削除しました"
    redirect_to customers_url
  end

  def discard
    @customer.discard
		flash[:notice] = "#{@customer.name}様をアーカイブしました"
    redirect_to customers_url
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_customer_visit_history
    @customer_visit_history = CustomerVisitHistory.find_by(customer_id: params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :remarks, :image)
  end
end
