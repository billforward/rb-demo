require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  sub_api = BillForward::SubscriptionsApi.new config.client

  sub_request = BillForward::CreateSubscriptionRequest.new ({
      "accountID": "ACC-7C87AA63-79BA-40CB-B5EC-78C867E7",
      "name": "name",
      "description": "desc",
      "product": "SaaS",
      "productRatePlan": "standard",
      "state": "AwaitingPayment",
      "pricingComponentQuantities": [ {
          "pricingComponent": "seats",
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