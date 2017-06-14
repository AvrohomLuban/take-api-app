class Company

  attr_accessor :id, :name, :buzzword, :bs

  HEADER = {"Accept" => "application/json", "Authorization" => "Token token=enterapi", "X-User-Email" => "lubanavs@gmail.com"}

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @buzzword = hash["buzzword"]
    @bs = hash["bs"]
  end

  def self.all
    companies = Unirest.get("http://localhost:3001/api/companies.json", headers: HEADER).body
    allcompanies = []
    companies.each do |company|
     allcompanies << Company.new(company)
   end
   allcompanies
 end

 def self.find_by(input)
  Company.new(Unirest.get("http://localhost:3001/api/companies/#{input[:id]}.json", headers: HEADER).body)
 end

 def delete
  Unirest.delete("http://localhost:3001/api/companies/#{self.id}.json", headers: HEADER,
      parameters: hash
                   ).body
  end

  def update(hash)
    Unirest.patch("http://localhost:3001/api/companies/#{self.id}.json", headers: HEADER,
      parameters: hash
                   ).body
  end

  def self.create(hash)
    Unirest.post("http://localhost:3001/api/companies.json", headers: HEADER,
      parameters: hash
                   ).body
  end


end
