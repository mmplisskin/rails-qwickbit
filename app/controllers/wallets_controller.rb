class WalletsController < ApplicationController
  before_action :find_wallet, only:[:show, :destroy]

  def index
    @wallets = Wallet.all
  end

  def show
    #code
  end

  def new
    @wallet = Wallet.new
  end
  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.business_id = current_business.id
    if @wallet.save
      flash[:notice] = 'Wallet was successfully added!'
      redirect_to wallets_path
    else
      flash.now[:error] = @wallet.errors.full_messages
      render :new
    end
  end

  def destroy
    @wallet.destroy
    redirect_to
  end

private
  def find_wallet
    @wallet = Wallet.find(params[:id])
  end
  def wallet_params
    params.require(:wallet).permit(:name, :wallet_address, :business_id)
  end
end
