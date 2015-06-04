require_relative "db/connection"

module GayParentsChat
  class Server < Sinatra::Base

    # A session is used to keep state during requests.
    # http://www.sinatrarb.com/intro.html#Using%20Sessions
    enable :sessions

    # Use _method magic to allow put/delete forms in browsers that don't support it.
    enable :method_override # same as doing use Rack::MethodOverride

    $db = PG.connect({dbname: 'gayparents'})

    configure :development do
      register Sinatra::Reloader
    end

    def logged_in?
      !!session[:user_id]
    end

    get('/') do
      @results = $db.exec_params("SELECT * FROM messages")

      erb :index
    end

  post '/users' do
    results = $db.exec_params("INSERT INTO users(name, email, password, created_at) VALUES ($1, $2, $3, CURRENT_TIMESTAMP) RETURNING id, name", [params[:name], params[:email], params[:password]])
    session[:user_id]= results.first['id']
    session[:user_name]=results.first["name"]
    redirect '/'
  end
 

    get '/messages' do
    end


    post '/messages' do
      $db.exec_params("INSERT INTO messages (topic, message, user_id, created_at) VALUES ($1, $2, $3, CURRENT_TIMESTAMP)", [params[:topic], params[:message], session[:user_id]])
      redirect '/'
    end

    get '/messages/:id' do
    end






  end #server
end #module