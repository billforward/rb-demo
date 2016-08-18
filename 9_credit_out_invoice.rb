require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::InvoicesApi.new config.client

  request = {
    "forcePaid":true
  }

  invoice_id = "INV-9EA0806B-310C-4728-B02C-21EB37B8"

  begin
    result = api.execute_invoice(invoice_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}