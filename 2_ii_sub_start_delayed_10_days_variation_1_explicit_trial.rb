require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api_instance = BillForward::SubscriptionsApi.new config.client

  request = BillForward::CreateSubscriptionRequest.new ({
      "accountID": "ACC-42398CA6-2907-4BFC-B213-BD033211",
      "name": "name",
      "description": "desc",
      "product": "SaaS",
      "productRatePlan": "standard",
      "state": "AwaitingPayment",
      "trialEnd": "2016-08-28T00:00:00Z"
})

  begin
    result = api_instance.create_subscription_v2(request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception: #{e.response_body || e}"
  end
}