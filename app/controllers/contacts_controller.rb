class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.create(contact_params)
    if @contact.save
      @contact.create_activity :create, owner: current_user
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      @contact.create_activity :update, owner: current_user
      flash[:success] = "Information has been updated"
      redirect_to @contact
    else
      flash[:alert] = "User information has not been updated"
      render 'edit'
    end
  end

  def destroy
    @contact.create_activity :destroy, owner: current_user
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :title, :company, :description,
                                    :email, :work, :mobile, :home, :street,
                                    :city, :state, :country, :zip,
                                    :contact_avatar, :all_company_tags)
  end

end