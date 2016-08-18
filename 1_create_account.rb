require_relative 'dependencies'

Pry::rescue{
  config = BillForwardDemo::Config.new

  api_instance = BillForward::AccountsApi.new config.client

  request = BillForward::CreateAccountRequest.new ({
      "profile": {
          "email": "bill.me@gent.ly",
          "firstName": "Billiam",
          "lastName": "Forward",
          "landline": "02000000000",
          "mobile": "",
          "dob": "1970-01-01T00:00:00Z",
          "addresses": [
              {
                  "addressLine1": "address line 1",
                  "addressLine2": "address line 2",
                  "addressLine3": "address line 3",
                  "city": "London",
                  "province": "London",
                  "country": "United Kingdom",
                  "postcode": "SW1 1AS",
                  "landline": "02000000000",
                  "primaryAddress": true
              }
          ],
          "companyName": "BillCorp",
          "vatNumber": "",
          "logoURL": "https://app-sandbox.billforward.net/resources/images/normal_logo.png",
          "deleted": false,
          "additionalInformation": ""
      }
  })

  begin
    result = api_instance.create_account(request)
    ap result
  rescue BillForward::ApiError => e
    puts "Exception: #{e.response_body || e}"
  end
}