class CompaniesController < ApplicationController

  def index
    # find all Company rows
      @companies = Company.all
    # render companies/index view
  end

  def show
    # find a Company
      @id = params["id"]
      @company = Company.find_by({"id" => @id})
      @contacts = Contact.where({"company_id" => @id})
    # render companies/show view with details about Company
  end

  def new
    # render view with new Company form
  end

  def create
    # start with a new Company
    # assign user-entered form data to Company's columns
      company = Company.new
      company["name"] = params["name"]
      company["city"] = params["city"]
      company["state"] = params["state"]
 
    #save Company row
      company.save

    # redirect user
      redirect_to "/companies"
  end

  def edit
    @company = Company.find_by({"id" => params["id"]})
  end

  def update
    company = Company.find_by({"id" => params["id"]})
    company["name"] = params["name"]
    company["city"] = params["city"]
    company["state"] = params["state"]
    company.save
    redirect_to "/companies"
  end

  def destroy
    company = Company.find_by({"id" => params["id"]})
    company.destroy
    redirect_to "/companies"
  end

end
