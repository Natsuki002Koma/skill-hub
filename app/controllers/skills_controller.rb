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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to skill_tweets_path(@skill)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:skill_name, :skill_status_id).merge(user_id: current_user.id, skill_level: "0")
  end
end
