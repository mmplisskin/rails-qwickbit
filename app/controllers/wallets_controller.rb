class WalletsController < ApplicationController
  require 'bitcoin'
  require 'pry'
  require 'chain'
  before_action :find_wallet, only:[:show, :destroy, :delete]
  before_action :check_wallet_amount, only:[:new, :create, :generate]
  # before_action :chain_client, only:[:create, :index]

  def index
    @wallets = Wallet.where(business_id: current_business)
    #  bal = chain_client.get_addresses(@wallets)
    #  @bal
    # bal = bal[0]["total"]["balance"]
    # @bal = bal * 0.00000001
  #   @wallets.each do |w|
  #       w.balance = chain_client.get_address(w.wallet_address)
  #       w.save
  #   end
  #  @wallets
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @wallets
        }
    end
  end

  def show

  end

  def new
    @wallet = Wallet.new
  end

  def generate
    @wallet = Wallet.new
    key = Bitcoin::generate_key
    @wallet.private_key = key[0]
    @wallet.wallet_address = Bitcoin::pubkey_to_address(key[1])
    balcal = chain_client.get_address(@wallet.wallet_address)
    @wallet.balance = balcal[0]["total"]["balance"]* 0.00000001
    @wallet.business_id = current_business.id
    if @wallet.save
      flash[:notice] = 'Wallet was successfully added!'
      redirect_to wallets_path
      return
    end

  end

  def create
    @wallet = Wallet.new(wallet_params)
    balcal = chain_client.get_address(@wallet.wallet_address)
    @wallet.balance = balcal[0]["total"]["balance"] * 0.00000001
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
    redirect_to wallets_path
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

  def chain_client
    chain_client = Chain::Client.new(key_id: ENV['API-KEY-ID'], key_secret: ENV['API-KEY-SECRET'])
  end
  def wallet_params
    params.require(:wallet).permit(:name, :wallet_address, :private_key, :business_id)
  end
end
