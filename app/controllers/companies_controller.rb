class CompaniesController < ApplicationController

  HEADER = {"Accept" => "application/json", "Authorization" => "Token token=enterapi", "X-User-Email" => "lubanavs@gmail.com"}
  def index
    @companies = Company.all
    render "index.html.erb"
  end

  def show
    # @company = Company.new(Unirest.get("http://localhost:3001/api/companies/#{params[:id]}.json").body)
    @company = Company.find_by({id: params[:id]})
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @company = Company.create({name: params[:name], buzzword: params[:buzzword], bs: params[:bs]})
    # @company = Unirest.post("http://localhost:3001/api/companies.json", headers: {"Accept" => "application/json"},
    #   parameters: {name: params[:name],
    #                buzzword: params[:buzzword],
    #                bs: params[:bs]
    #                }
    #                ).body
    redirect_to "/"
  end

  def edit
    @company = Unirest.get("http://localhost:3001/api/companies/#{params[:id]}.json", headers: HEADER,
      parameters: hash
                   ).body
    render "edit.html.erb"
  end

  def update
    company = Company.find_by({id: params[:id]})
    company.update({name: params[:name], buzzword: params[:buzzword], bs: params[:bs]})
    # @company = Unirest.patch("http://localhost:3001/api/companies/#{params[:id]}.json", headers: {"Accept" => "application/json"},
    #   parameters: {name: params[:name],
    #               buzzword: params[:buzzword],
    #               bs: params[:bs]
    #               }).body
    redirect_to "/"
  end

  def destroy
    # Unirest.delete("http://localhost:3001/api/companies/#{params[:id]}.json", headers: {"Accept" => "application/json"}).body
    company = Company.find_by({id: params[:id]})
    company.delete
    redirect_to "/"
  end


end
