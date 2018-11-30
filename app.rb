require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get ('/') do
  @kidtionary = Word.show_all_words
  (erb :input)
end

post ('/') do
  Contact.new(params)
  redirect "/"
end

get ('/contact/:id') do
  @contact = Contact.find_contact(params[:id].to_i)
  (erb :contact)
end

post ('/contact/:id') do
  @contact = Contact.find_contact(params[:id].to_i)
  @contact.add_address(params)
  redirect 'contact/:id'
  # (erb :contact)
end

get ('/delete/:contact_id') do
  contact_id = params[:contact_id].to_i
  Contact.delete_contact(contact_id)
  @contact_list = Contact.show_all_contacts
  redirect "/"
end

get ('/contact/:contact_id/:address_delete_id') do
    @contact = Contact.find_contact(params[:contact_id].to_i)
    address_id = params[:address_delete_id].to_i
    @contact.delete_address(address_id)
    (erb :contact)

  end
