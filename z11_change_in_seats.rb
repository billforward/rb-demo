require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::SubscriptionsApi.new config.client

  request = BillForward::BatchUpdatePricingComponentValuesRequest.new({
      "values": [
          {
              "pricingComponent": "seats",
              "value": 5
          }
      ]
  })

  subscription_id = "SUB-B14C8FDE-A5D6-4A40-9DB5-131B431C"

  begin
    result = api.set_pricing_component_value_on_subscription_batch_update(subscription_id, request)
    pp result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}