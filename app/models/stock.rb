class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],secret_token: 'sk_572f4c093afa4184ae35fdf51bf455f9',
        endpoint: 'https://cloud.iexapis.com/v1')
        client.price(ticker_symbol)
    end
end
