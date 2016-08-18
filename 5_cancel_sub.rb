require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  sub_api = BillForward::SubscriptionsApi.new config.client

  request = BillForward::CancelSubscriptionRequest.new ({
      "source": "Going on a sojourn to Egypt"
  })


  subscription_id = 'SUB-8D9B11BA-DE04-4F01-A4F4-29DF5F03'

  begin
    # cancel
    result = sub_api.cancel_subscription(subscription_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

  revive_request = BillForward::ReviveSubscriptionRequest.new ({
  })

  begin
    # revive
    result = sub_api.revive_subscription(subscription_id, revive_request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}