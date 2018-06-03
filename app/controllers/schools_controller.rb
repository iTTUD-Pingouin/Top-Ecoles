class SchoolsController < ApplicationController
  def index
    @filters = params.permit(
      # base
      :city, :type,
      # aggregats primaire
      "primaire.sections",
      # aggregats college
      "college.sections",
      "college.statut",
      "college.activities",
      # aggregats lycee
      "lycee_filieres.name",
      "lycee.sections",
      "lycee.statut",
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
      @aggregations = ["college.sections", "college.statut", "college.activities"]
    when 'lycee'
      conditions[:has_lycee] = true

      # SANS RANGE
      # @aggregations = ["lycee.sections", "lycee_filieres.name", "lycee_filieres.mention_rate"]

      # AVEC RANGE
      rate_ranges = [{from: 0, to: 70}, {from: 70, to: 80}, {from: 80, to: 90}, {from: 90, to: 100}]

      @aggregations = {
        "lycee.sections" => { limit: 1000 },
        "lycee.statut" => { limit: 1000 },
        "lycee_filieres.name" => { limit: 1000 },
        "lycee_filieres.mention_rate" => { ranges: rate_ranges },
      }

    end

    # Aggregats Collège
    if params["college.sections"].present?
      conditions["college.sections"] = params["college.sections"]
    end

    if params["college.statut"].present?
      conditions["college.statut"] = params["college.statut"]
    end

    if params["college.activities"].present?
      conditions["college.activities"] = params["college.activities"]
    end

    # Aggregats Lycée
    if params["lycee_filieres.name"].present?
      conditions["lycee_filieres.name"] = params["lycee_filieres.name"]
    end

    if params["lycee.statut"].present?
      conditions["lycee.statut"] = params["lycee.statut"]
    end

    if params["lycee.sections"].present?
      conditions["lycee.sections"] = params["lycee.sections"]
    end

    if params["lycee_filieres.mention_rate"].present?
      range_boundaries = params["lycee_filieres.mention_rate"].split("-").map(&:to_i) # => [70, 80]
      conditions["lycee_filieres.mention_rate"] = Range.new(*range_boundaries) # => 70..80
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
