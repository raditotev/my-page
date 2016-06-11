class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      respond_to do |format|
        format.html {
          flash[:success] = "Thank you for your message."
          redirect_to contact_path
        }
        format.js { flash.now[:success] = "Thank you for your message." }
      end
    else
      respond_to do |format|
        format.html {
          flash.now[:error] = 'Cannot send message.'
          render :new
        }
        format.js { flash.now[:error] = 'Cannot send message.'}
      end
    end
  end
end
