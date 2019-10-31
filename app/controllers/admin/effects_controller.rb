class Admin::EffectsController < ApplicationController
  include ApplicationHelper

  before_action :set_effect, only: [:show, :edit, :update, :destroy]
  before_action :admin_flg

  def index
    @effects = Effect.all
  end

  def new
    if params[:back]
      @effect = Effect.new(effect_params)
    else
      @effect = Effect.new
    end
  end

  def create
    @effect = Effect.new(effect_params)
    if @effect.save
      redirect_to admin_effects_path, notice: "効果を作成しました!"
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @effect.update(effect_params)
      redirect_to admin_effects_path, notice: "効果を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @effect.destroy
    redirect_to admin_effects_path, notice: "効果を削除しました！"
  end

  private

  def effect_params
    params.require(:effect).permit(:name)
  end

  def set_effect
    @effect = Effect.find(params[:id])
  end
end
