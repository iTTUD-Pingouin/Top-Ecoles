class SchoolsController < ApplicationController
  def index
    @filters = params.permit(
      # base
      :city, :type,
      # aggregats
      "lycee_filieres.name",
      "lycee.sections",
      "lycee_filieres.mention_rate"
    )

    conditions = {}
    @aggregations = []

    # Query
    if params[:city].present?
      @query = params[:city]
    else
      @query = "*"
    end

    # Type etablissement
    case params[:type]
    when 'primaire'
      conditions[:has_primaire] = true
    when 'college'
      conditions[:has_college] = true
    when 'lycee'
      conditions[:has_lycee] = true
      @aggregations = ["lycee.sections", "lycee_filieres.name", "lycee_filieres.mention_rate"]
    end

    # Aggregats
    if params["lycee_filieres.name"].present?
      conditions["lycee_filieres.name"] = params["lycee_filieres.name"]
    end

    if params["lycee.sections"].present?
      conditions["lycee.sections"] = params["lycee.sections"]
    end

    if params["lycee_filieres.mention_rate"].present?
      conditions["lycee_filieres.mention_rate"] = params["lycee_filieres.mention_rate"]
    end


    @search  = School.search(@query, where: conditions, aggs: @aggregations)
    @schools = @search.results
  end

  def show
    @school = School.find(params[:id])
  end

  def selection
  end
end
