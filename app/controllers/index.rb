
get '/' do
  @urls = Url.all
  erb :index
end

get '/:short_url' do
  url_object = Url.find_by_short_url(params[:short_url])
  long_url = url_object.long_url
  url_object.click_count += 1
  url_object.save
  redirect long_url
end


post '/urls' do
  Url.create(
    long_url: params[:user_input],
    short_url: Url.random_phrase(6), 
    click_count: 0)
  @urls = Url.all
  erb :index
end

delete '/:short_url' do
end
