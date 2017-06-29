class sinatra {
  #    include sinatra::user
    include sinatra::user, sinatra::deployment, sinatra::service
}
