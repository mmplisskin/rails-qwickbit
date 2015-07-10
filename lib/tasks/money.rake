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

  task :rate => :environment do
    response = Net::HTTP.get_response(URI.parse("https://api.bitcoinaverage.com/exchanges/USD"))
    parsed_response = JSON.parse(response.body)
    bitfinex_rate=parsed_response["bitfinex"]["rates"]["last"]
    coinbase_rate=parsed_response["coinbase"]["rates"]["last"]
    okcoin_rate=parsed_response["okcoinintl"]["rates"]["last"]
    average_rate=(bitfinex_rate+coinbase_rate+okcoin_rate)/3

    rate = Rate.first
    rate.bitfinex_rate = bitfinex_rate
    rate.coinbase_rate = coinbase_rate
    rate.okcoin_rate = okcoin_rate
    rate.average_rate = average_rate

    rate.save

  end

  puts "$%$%$%$%$%$% ALL $$$ HAS BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
