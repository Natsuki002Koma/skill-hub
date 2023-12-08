class SkillsController < ApplicationController
  def index
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to root_path
    else
      puts @skill.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:skill_name, :skill_status_id).merge(user_id: current_user.id, skill_level: "0")
  end
end
