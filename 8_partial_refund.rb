require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::RefundsApi.new config.client

  request = BillForward::Refund.new ({
      "value": 1,
      "invoiceID": "INV-9EA0806B-310C-4728-B02C-21EB37B8"
  })

  begin
    # cancel
    result = api.create_refund(request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}