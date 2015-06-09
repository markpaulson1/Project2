require_relative "db/connection"

module NewDadsChat
  class Server < Sinatra::Base

    # A session is used to keep state during requests.
    # http://www.sinatrarb.com/intro.html#Using%20Sessions
    enable :sessions

    # Use _method magic to allow put/delete forms in browsers that don't support it.
    enable :method_override # same as doing use Rack::MethodOverride


    configure :development do
      $db = PG.connect dbname: "newdads", host: "localhost"
      register Sinatra::Reloader
    end

    configure :production do
      require 'uri'
      uri = URI.parse ENV["DATABASE_URL"]
      $db = PG.connect dbname: uri.path[1..-1],
                         host: uri.host,
                         port: uri.port,
                         user: uri.user,
                     password: uri.password
    end



    def logged_in?
      !!session[:user_id]
    end

    get('/') do

      @results = $db.exec_params("SELECT * FROM messages")
      @comments = $db.exec_params("SELECT messages.*, comments.* FROM messages LEFT JOIN comments ON comments.message_id = messages.id WHERE messages.id  = comments.user_id;")



      # ("SELECT messages.*, comments.* FROM comments JOIN messages ON comments.user_id = messages.user_id WHERE comments.message_id = messages.id;")

      # ("SELECT messages.*, comments.* FROM comments JOIN messages ON comments.user_id = messages.user_id WHERE comments.user_id = messages.id;")

      # ("SELECT comments.*, messages.name FROM comments JOIN messages ON messages.user_id = comments.user_id;")
      # ("SELECT tweets.*, users.name  FROM tweets JOIN users ON users.id = tweets.user_id;")

      erb :index
    end

    post '/users/addcomment' do
      # results = $db.exec_params("INSERT INTO comments(message_id, user_id, comment, created_at) VALUES ()")

      redirect '/'
    end

  post '/users' do
    results = $db.exec_params("INSERT INTO users(name, email, password, created_at) VALUES ($1, $2, $3, CURRENT_TIMESTAMP) RETURNING id, name", [params[:name], params[:email], params[:password]])
    session[:user_id]= results.first['id']
    session[:user_name]=results.first["name"]
    redirect '/'
  end

   post '/users/login' do
      results = $db.exec_params("SELECT * FROM users WHERE email = $1 and 
        password = $2", [params[:email], params[:password]])
      if results.first.nil?
        @message = 'incorrect email or password'
        erb :loginfail
      else
        session[:user_id]= results.first['id']
        session[:user_name]=results.first["name"]
        redirect '/'
    end
  end     


  
 

  
    post '/messages' do
      $db.exec_params("INSERT INTO messages (topic, message, user_id, created_at) VALUES ($1, $2, $3, CURRENT_TIMESTAMP)", [params[:topic], params[:message], session[:user_id]])
      redirect '/'
    end

   






  end #server
end #module