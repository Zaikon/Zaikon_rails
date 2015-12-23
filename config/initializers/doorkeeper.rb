Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  # orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user || warden.authenticate!(scope: :user)
  end

  resource_owner_from_credentials do |routes|
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_for_authentication? { user.valid_password?(params[:password]) }
      user
    end
  end
end

Doorkeeper.configuration.token_grant_types << "password"
