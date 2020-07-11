class Company
  attr_reader :name, :url, :market, :location, :team_size, :other_tech

  def initialize(name:, url:, market:, location:, team_size:, other_tech:)
    @name = name
    @url = url
    @market = market
    @location = location
    @team_size = team_size
    @other_tech = other_tech
  end
end

company_file = Rails.root.join("public").join("companies.yml")
COMPANIES = YAML.load_file(company_file).map do |company|
  Company.new(**company.symbolize_keys)
end

