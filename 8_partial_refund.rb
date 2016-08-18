require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::RefundsApi.new config.client

  request = BillForward::Refund.new ({
      "value": 1,
      "invoiceID": "INV-5E94521D-38BD-4B10-B765-D1BBC0B6"
  })

  begin
    # cancel
    result = api.create_refund(request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}