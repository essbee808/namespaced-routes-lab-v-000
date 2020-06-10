class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      redirect_to @preference
    else
      render :new
    end
  end

  def show
    @preference = Preference.find([:id])
  end

  def preference_params
    params.require(:preference).permit(:allow_create_songs, :allow_create_artists)
  end

end
