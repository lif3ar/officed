class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    @contact.user_id = current_user.id
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
      redirect_to @contact
    else
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
                                    :contact_avatar)
  end

end