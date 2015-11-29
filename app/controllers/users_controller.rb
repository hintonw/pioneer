class UsersController < ApplicationController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def new_api
    render :json => User.where(["email = ?", params[:email]])
  end

end
