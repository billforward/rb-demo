require_relative 'dependencies'

Pry::rescue{

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