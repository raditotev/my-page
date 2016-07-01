class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admin_path
  end

  #Sends an email when comment is posted
  def send_email comment
    name = comment.author
    email = comment.email == "" ? "no@email.provided" : comment.email
    message = %Q(
      <h3>#{comment.author} commented on <a href='#{post_url comment.post}' target='_blank'>#{comment.post.title}</a></h3>
      <strong> #{comment.email}</strong>
      <p>#{comment.content}</p>
    ).html_safe
    email_comment = Contact.new(name: name, email: email, message: message)
    email_comment.deliver
  end
end
