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
      "college.pensionnat",

      # aggregats lycee
      "lycee_filieres.name",
      "lycee.sections",
      "lycee.statut",
      "lycee_filieres.mention_rate"
    )

    conditions = {}
    @aggregations = []

    # Résultats retournés selon si la ville a été précisée ou pas
    if params[:city].present?
      @query = params[:city]
    else
      @query = "*"
    end

    # Vérification du type etablissement par rapport au premier filtre
    case params[:type]
    when 'primaire'
      conditions[:has_primaire] = true
    when 'college'
      conditions[:has_college] = true
      @aggregations = ["college.sections", "college.statut", "college.activities", "college.pensionnat"]
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

    if params["college.pensionnat"].present?
      conditions["college.pensionnat"] = params["college.pensionnat"]
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



# ------------ Selection : renvoit les écoles sélectionnées à la page de comparaison -----------------------------------------------------
  def selection
    @schools = []
    session[:selection].each do |school_id|
      @schools << School.find(school_id)
    end
  end


# ---- Add to compare to list : ajoute une école à la sélection (cookies without log in)
# ---- Amorce le compteur d'écoles sélectionnées AJAX et au rechargement de la page ---
  def add_to_compare_list
    session[:selection] = [] unless session[:selection]

    if session[:selection].include?(params[:id].to_s)
      session[:selection] -= ["#{params[:id]}"]
    else
      session[:selection] << params[:id]
    end

    if session[:selection].size > 0
      @counter = true
    else
      @counter = false
    end
  end


# ---- Supprime toutes les écoles sélectionnées des cookies
# ---- supprime le compteur en haut à droite et toutes les pastilles oranges.
  def clean_list
    session[:selection] = []
  end
end
