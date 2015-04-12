class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @merchants = Merchant.all
  end

  def show
  end

  def new
    @merchant = Merchant.new
  end

  def edit
  end

  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to user_merchant_path([@user, @merchant]), notice: 'Merchant was successfully created.' }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to user_merchant_path([@user, @merchant]), notice: 'Merchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to user_merchant_path(@user), notice: 'Merchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
      params.require(:merchant).permit(:name, :code, :owner_id, :address)
    end
end
