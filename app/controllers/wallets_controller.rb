class WalletsController < ApplicationController
  require 'bitcoin'
  require 'pry'
  before_action :find_wallet, only:[:show, :destroy, :delete]
  before_action :check_wallet_amount, only:[:new, :create, :generate]

  def index
    @wallets = Wallet.all
  end

  def show
    #code
  end

  def new
    @wallet = Wallet.new
  end

  def generate
    @wallet = Wallet.new
    key = Bitcoin::generate_key

    @wallet.private_key = key[0]
    @wallet.wallet_address = key[1]
    @wallet.business_id = current_business.id
    if @wallet.save
      flash[:notice] = 'Wallet was successfully added!'
      redirect_to wallets_path
      return
    end

    # @wallet = key
    # binding.pry

    # if @wallet.save
    # end
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
  def check_wallet_amount
      amount = Wallet.where( :business_id => current_business.id )
    if amount.size > 4
      flash[:notice] = "Please remove a wallet before adding more and be sure to remove your $$$$ we are not responsible for anything... ever!"
      redirect_to wallets_path
      return
    else
    end
  end
  def wallet_params
    params.require(:wallet).permit(:name, :wallet_address, :private_key, :business_id)
  end
end
