namespace :get do
  desc "updates wallet balances"
  require 'chain'
  chain_client = Chain::Client.new(key_id: ENV['API-KEY-ID'], key_secret: ENV['API-KEY-SECRET'])
  task :money => :environment do
    addresses = []
    @wallets = Wallet.where("updated_at > ?", 1.day.ago)
    @wallets.each do |w|
      addresses << w.wallet_address
    end
    if addresses.size > 0
      result = chain_client.get_addresses(addresses)
      result.each do |r|
        wallet_address = r["address"]
        bal = r["total"]["balance"]
        balance = bal * 0.00000001
        @wallet = Wallet.find_by(wallet_address: wallet_address)
        @wallet.update(balance: "balance")
      end
    end
  end
  puts "$%$%$%$%$%$% ALL $$$ HAS BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
