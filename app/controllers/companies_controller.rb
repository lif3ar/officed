class CompaniesController < ApplicationController
  require "paperclip/storage/ftp"
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_same_user, except: [:index, :new, :create]

  def index
    @companies = current_user.companies.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @companies.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companies.create(company_params)
    if @company.save
      @company.create_activity :create, owner: current_user
      redirect_to @company
    else
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
    @company_comments = CompanyComment.where(company_id: @company)
  end

  def edit

  end

  def update
    @company.update(company_params)
    if @company.save
      @company.create_activity :update, owner: current_user
      redirect_to @company
    else
      flash[:alert] = "Company information has not been updated"
      render 'Edit'
    end
  end

  def destroy
    @company.create_activity :destroy, owner: current_user
    @company.destroy
    redirect_to companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :website, :phone, :description,
                                    :street, :city, :state, :country, :zip,
                                    :all_company_tags, :company_logo)
  end

  def require_same_user
    if @company.user_id != current_user.id
      redirect_to root_path
    end
  end

end