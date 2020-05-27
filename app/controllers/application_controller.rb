class ApplicationController < ActionController::Base
    # Rails has a set of rules when we are trying to communicate with a route. One of those rules is that they use what is 
    # called a CSRF token. This is a secure token that is generated through our secret key value by the system and it checks 
    # to make sure tsss

    skip_before_action :verify_authenticity_token
end
