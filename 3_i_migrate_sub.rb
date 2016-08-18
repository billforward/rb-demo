require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  sub_api = BillForward::SubscriptionsApi.new config.client

  request = BillForward::MigrationRequest.new ({
      "product": "SaaS",
      "productRatePlan": "yearly"
  })

  subscription_id = 'SUB-8D9B11BA-DE04-4F01-A4F4-29DF5F03'

  begin
    result = sub_api.migrate_subscription(subscription_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}