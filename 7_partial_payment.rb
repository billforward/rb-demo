require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::InvoicesApi.new config.client

  request = {
      "id": "INV-9EA0806B-310C-4728-B02C-21EB37B8",
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