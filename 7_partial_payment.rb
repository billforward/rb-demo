require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::InvoicesApi.new config.client

  request = {
      "id": "INV-5E94521D-38BD-4B10-B765-D1BBC0B6",
      "state": "Unpaid",
      "paymentAmount": 1.00
  }

  begin
    # cancel
    result = api.update_invoice(request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}