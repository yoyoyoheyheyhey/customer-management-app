class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def show
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
    @customer.avatar.purge
		flash[:notice] = '顧客情報を更新しました'
    redirect_to customers_url
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :remarks, :avatar)
  end
end
