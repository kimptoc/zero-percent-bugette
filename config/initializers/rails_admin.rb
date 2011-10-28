RailsAdmin.config do |config|
  config.default_hidden_fields = []
  config.models do
    fields_of_type :datetime do
      strftime_format "%Y-%m-%d %H:%M:%S.%L"
    end
  end
  #config.models do
  #  list do
  #    fields_of_type :datetime do
  #      date_format :compact
  #    end
  #  end
  #end
end