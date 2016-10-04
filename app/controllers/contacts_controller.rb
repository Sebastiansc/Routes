class ContactsController < ApplicationController
  def index
    # @contacts = Contact.all
    # render json: @contacts

    @user = User.find(params[:user_id])
    @total_contacts = @user.shared_contacts + @user.contacts
    render json: @total_contacts
  end

  def favorites
    @user = User.find(params[:id])
    shared_favorites = @user.shared_contacts.where(favorite: true)
    favorites = @user.contacts.where(favorite: true)
    render json: (shared_favorites + favorites)
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
