class CurrencyResource < JSONAPI::Resource
  attributes :name, :code, :symbol
end
