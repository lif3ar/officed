class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.create(contact_params)
    if @contact.save
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
      flash[:success] = "Information has been updated"
      redirect_to @contact
    else
      flash[:alert] = "User information has not been updated"
      render 'edit'
    end
  end

  def destroy
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