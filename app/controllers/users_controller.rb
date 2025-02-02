class UsersController < ApplicationController 

  def index
    matching_users = User.all 
    @list_of_users = matching_users.order({ :username => :asc })


    render({ :template => "users/index.html.erb" })
  end

  def show 
    #Parameters: {"path_username"=>"alice"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #if @the_user == nil
      #redirect_to("/404")
    #else
      render({ :template => "users/show.html.erb" })
    #end
  end


end