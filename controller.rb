require('sinatra')
require('sinatra/contrib/all')

require_relative('models/customer')
require_relative('models/film')
require_relative('models/screenings')
require_relative('models/ticket')
also_reload('./models/*')

get '/' do
  @films = Film.all
  erb(:home)

end

get '/about' do
  erb(:about)
end

get '/films' do
  @films = Film.all()
  erb(:films)
end

get '/in_bruge' do
  @films = Film.all
  @screenings = Screening.all
  erb(:in_bruge)

end

get '/three_billboards' do
  @films = Film.all
  @screenings = Screening.all
  erb(:three_billboards)
end

get '/seven_psychopaths' do
  @films = Film.all
  @screenings = Screening.all
  erb(:seven_psychopaths)
end
