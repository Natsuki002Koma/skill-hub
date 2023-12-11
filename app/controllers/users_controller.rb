class UsersController < ApplicationController
  def index
    @users = User.all
    @skills = Skill.all.includes(:user)
  end
end
