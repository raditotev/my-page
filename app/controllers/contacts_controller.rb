class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      respond_to do |format|
        format.html { redirect_to contact_path, flash: { success: "Thank you for your message. We will contact you soon!" } }
        format.js { flash.now[:success] = "Thank you for your message. We will contact you soon!" }
      end
    else
      respond_to do |format|
        format.html { render :new, flash.now[:error] = 'Cannot send message.' }
        format.js { flash.now[:error] = 'Cannot send message.' }
      end
    end
  end
end
