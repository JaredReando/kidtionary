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
  Word.new(params)
  redirect "/"
end

get ('/definition/:id') do
  @word = Word.word_search(params[:id].to_i)
  (erb :defintion)
end

post ('/definition/:id') do
  @word = Word.word_search(params[:id].to_i)
  @word.add_definition(params)
  redirect 'defintion/:id'
end

get ('/delete/:word_id') do
  word_id = params[:word_id].to_i
  Word.delete_word(word_id)
  @dictionary = Word.show_all_words
  redirect "/"
end

get ('/contact/:word_id/:definiition_delete_id') do
    @word = Word.word_search(params[:word_id].to_i)
    definition_id = params[:definition_delete_id].to_i
    @word.delete_definition(definition_id)
    (erb :defintion)

  end
