require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::SubscriptionsApi.new config.client

  request = {
      "values": [
          {
              "pricingComponent": "seats",
              "value": 5
          }
      ]
  }

  subscription_id = "SUB-2E937BCB-2780-4B1D-B7EB-5789D5FE"

  begin
    # TODO: generate `subscriptions/{subscription-ID}/values` endpoint
    result = api.set_pricing_component_value_on_subscription(subscription_id, request)
    pp result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}