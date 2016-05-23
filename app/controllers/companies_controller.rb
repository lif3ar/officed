class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companies.create(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit

  end

  def update
    @company.update(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      flash[:alert] = "Company information has not been updated"
      render 'Edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :website, :phone, :description,
                                    :street, :city, :state, :country, :zip)
  end

end