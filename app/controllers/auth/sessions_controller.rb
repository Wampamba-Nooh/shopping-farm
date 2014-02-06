module Auth 
  
  class SessionsController < Devise::SessionsController
    layout 'devise'
  end

end