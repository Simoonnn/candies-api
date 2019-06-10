class AdminController < ApplicationController
  def login
    password = params['password']
    email = params['email']
    admin = Admin.find_by(email: email)
    fail_response = { success: false }
    if admin
      if admin.authenticate(password)
        token = Digest::MD5.hexdigest([Time.now, rand].join(''))
        token_digest = BCrypt::Password.create(token)
        admin.update_attribute(:session_digest, token_digest)
        render json: {token: token, email: email, success: 'true'}
      else
        render json: fail_response
      end
    else
      render json: fail_response
    end
  end

  def register
  end

  def is_logged_in
    email = params['email']
    token = params['token']
    fail_response = { success: 'false' }
    admin = Admin.find_by(email: email)
    if admin
      session_digest_object = BCrypt::Password.new(admin.session_digest)
      if session_digest_object == token
        render json: { success: 'true' }
      else
        render json: fail_response
      end
    else
      render json: fail_response
    end
  end
end
