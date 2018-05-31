class SchoolsController < ApplicationController
  def index




    @schools = []

    if !params[:city].blank? && params[:type] == 'lycee'
      results = Lycee.search(params[:city])
      results.each do |result|
        @schools << result.school
      end

    elsif !params[:city].blank? && params[:type] == 'college'
      results = College.search(params[:city])
      results.each do |result|
        @schools << result.school
      end

    elsif !params[:city].blank? && params[:type] == 'primaire'
      results = Primaire.search(params[:city])
      results.each do |result|
        @schools << result.school
      end

    elsif params[:type] == 'lycee'
      School.all.each do |school|
        if school.lycee
          @schools << school
        end
      end
    elsif params[:type] == 'college'
      School.all.each do |school|
        if school.college
          @schools << school
        end
      end
    elsif params[:type] == 'primaire'
      School.all.each do |school|
        if school.primaire
          @schools << school
        end
      end
    end

    @schools

  end

  def show
    @school = School.find(params[:id])
  end

  def selection
  end


end
