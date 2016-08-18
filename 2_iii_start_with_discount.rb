require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  # Create a Coupon
  coupon_request = BillForward::Coupon.new({
    "name":"gh-disc",
    "couponCode":"gh-disc",
    "coupons":10000,
    "currency": "usd",
    "uses":1,
    "discounts":[
      {
        "percentageDiscount":50
      }
    ]
  })

  coupon_api = BillForward::CouponsApi.new config.client

  begin
    result = coupon_api.create_coupon(coupon_request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

  sub_api = BillForward::SubscriptionsApi.new config.client

  sub_request = {
      "accountID": "ACC-42398CA6-2907-4BFC-B213-BD033211",
      "name": "name",
      "description": "desc",
      "product": "SaaS",
      "productRatePlan": "standard",
      "state": "AwaitingPayment",
      "couponCodes": [ "gh-disc" ]
}

  begin
    result = sub_api.create_subscription_v2(sub_request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end


}