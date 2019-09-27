FactoryBot.define do
  factory :item do
    name                   {"ナルト"}
    price                  {500}
    description            {"うずまき"}
    condition_id           {1}
    user_id                {1}
    buyer_id               {1}
    size_id                {1}
    category_id            {374}
    brand_id               {1}
    prefecture_id          {1}
    shipfee_id             {1}
    shipmethod_id          {1}
    shipdate_id            {1}
    trading_condition      {1}
    # category               {"レディース"}
  end
end
