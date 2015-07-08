module ItemsHelper

  def wallets
  wallets = Wallet.where(business_id: current_business)


    end
end
