require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api = BillForward::AccountsApi.new config.client

  request = BillForward::AddChargesToAccountAPIRequest.new({
      "currency": "USD",
      "charges": [
          {
              "name": "Professional services",
              "description": "Widget cleaning",
              "amount": "100"
          }
      ]
  })

  account_id = 'ACC-42398CA6-2907-4BFC-B213-BD033211'

  begin
    # cancel
    result = api.add_charge_to_account(account_id, request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception : #{e.response_body || e}"
  end
}

# TODO: generate endpoint

=begin
```bash
curl "http://127.0.0.1:8080/RestAPI/accounts/{account-ID}/invoice" \
    -H "Authorization: Bearer a42711e7-171c-4337-b652-3291c53fc64d" \
    -H "Content-Type: application/json" \
    -X POST \
    -d \
'{
  "currency": "USD",
  "charges": [
    {
      "name": "Professional services",
      "description": "Widget cleaning",
      "amount": "100"
    }
  ]
}'
```
=end