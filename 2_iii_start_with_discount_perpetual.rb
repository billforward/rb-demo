require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  sub_api = BillForward::SubscriptionsApi.new config.client

  sub_request = BillForward::CreateSubscriptionRequest.new ({
      "accountID": "ACC-42398CA6-2907-4BFC-B213-BD033211",
      "name": "name",
      "description": "desc",
      "product": "SaaS",
      "productRatePlan": "standard",
      "state": "AwaitingPayment",
      "pricingComponentQuantities": [ {
          "pricingComponent": "users",
          "quantity": "20",
          "percentageDiscount": 50
      }]
  })

  begin
    result = sub_api.create_subscription_v2(sub_request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}