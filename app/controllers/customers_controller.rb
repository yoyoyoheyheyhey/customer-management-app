class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy discard hairstyle_images create_images]
  before_action :set_customer_visit_history, only: :show
  before_action :set_image_attachment, only: :destroy_image

  def index
    @q = Customer.kept.ransack(params[:q])
    @customers = @q.result
  end

  def hairstyle_images
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

  def create_images
    @image = params[:customer][:images]
    @image.tempfile = ImageProcessing::MiniMagick.source(@image.tempfile).resize_to_limit(400, 400).call
    blob = ActiveStorage::Blob.create_and_upload!(io: File.new(@image.tempfile.path),  filename: @image.original_filename)
    @customer.images.attach(blob.signed_id)
    if @customer.save!
			flash[:notice] = '画像を追加しました'
      redirect_to hairstyle_images_customer_path(@customer)
    else
			flash[:alert] = '画像の追加に失敗しました'
      render customer_path(@customer)
    end
  end

  def destroy
    @customer.destroy
		flash[:notice] = "#{@customer.name}を削除しました"
    redirect_to customers_url
  end

  def destroy_image
    @image.purge
		flash[:notice] = "#{@image.filename}を削除しました"
    redirect_to hairstyle_images_customer_path(@customer)
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

  def set_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @customer = Customer.find(@image.record_id)
  end

  def set_customer_visit_history
    @customer_visit_history = CustomerVisitHistory.find_by(customer_id: params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :remarks, images: [])
  end
end
