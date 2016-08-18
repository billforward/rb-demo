require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::InvoicesApi.new config.client

  request = BillForward::Refund.new ({
  })

  invoice_id = "INV-B85EC16E-CC7E-4298-9540-E09EB87C"

  begin
    result = api.execute_invoice(invoice_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end

}