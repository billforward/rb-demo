require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  sub_api = BillForward::SubscriptionsApi.new config.client

  request = BillForward::MigrationRequest.new ({
      "product": "SaaS",
      "productRatePlan": "yearly"
  })

  subscription_id = 'SUB-7C1579CD-2070-4988-B3C4-8092088C'

  begin
    result = sub_api.migrate_subscription(subscription_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}