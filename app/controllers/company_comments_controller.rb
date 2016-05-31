class CompanyCommentsController < ApplicationController

  def new
    @company_comment = CompanyComment.new
  end

  def create
    @company = Company.find(params[:company_id])
    @company_comment = @company.company_comments.create(company_comment_params)
    @company_comment.user_id = current_user.id
    @company_comment.company_id = @company.id
    if @company_comment.save
      @company_comment.create_activity :create, owner: current_user
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @company_comment.update(company_comment_params)
    if @company_comment.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @company_comment.create_activity :destroy, owner: current_user
    @company_comment.destroy
    redirect_to company_path(@company)
  end

  private

  def set_company_comment
    @company_comment = CompanyComment.find(company_comment_params)
  end

  def company_comment_params
    params.require(:company_comment).permit(:content)
  end

end