require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::SubscriptionsApi.new config.client

  request = BillForward::CreateSubscriptionRequest.new ({
      "accountID": "ACC-2E937BCB-2780-4B1D-B7EB-5789D5FE",
      "name": "name",
      "description": "desc",
      "product": "SaaS",
      "productRatePlan": "standard",
      "state": "AwaitingPayment"
  })

  begin
    result = api.create_subscription_v2(request)
    pp result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

  revive_request = BillForward::ReviveSubscriptionRequest.new ({
  })

  subscription_id = "SUB-2E937BCB-2780-4B1D-B7EB-5789D5FE"

  begin
    # revive
    result = api.revive_subscription(subscription_id, revive_request)
    pp result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}