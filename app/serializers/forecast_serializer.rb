class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :summary, :temperature



end
