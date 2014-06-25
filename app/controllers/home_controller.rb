class HomeController < ApplicationController
  def show
    @people = Person.includes(:sessions).available
  end
end
