class School < ApplicationRecord
  has_one :college
  has_one :primaire
  has_one :lycee

  searchkick

  # {
  #   name: "Sacré coeur",
  #   commune: "Paris",
  #   statut: "public",
  #   has_primaire: false,
  #   has_college: true,
  #   has_lycee: true,
  #   primaire: {},
  #   college: {
  #     address: "15 rue blabla",
  #     total_fees: 500,
  #     sections: [
  #       "européenne",
  #       "bi-nationale"
  #     ],
  #     options: [
  #       "chinois",
  #       "neuleuh"
  #     ]
  #   },
  #   lyceee: {
  #     address: "32 rue blabla",
  #     total_fees: 800,
  #     sections: [
  #       "européenne",
  #       "bi-nationale",
  #       "internationale"
  #     ],
  #     options: [
  #       "chinois",
  #       "sciences"
  #     ]
  #   },
  #   lycee_filieres: [
  #     {
  #       name: "S",
  #       success_rate: 60,
  #       serie: "professionel"
  #       # ....
  #     }
  #   ]
  # }
  def search_data
    data = {
      name: name,
      commune: commune,
      statut: statut,
      has_primaire: primaire.present?,
      has_college: college.present?,
      has_lycee: lycee.present?
    }

    if college
      data[:college] = {
        address: college.address,
        total_fees: college.total_fees,
        commune: college.commune,
        uai: college.uai
        # ...
      }
    end

    if lycee
      data[:lycee] = {
        address: lycee.address,
        total_fees: lycee.total_fees,
        sections: lycee.sections,
        options: lycee.options,
        commune: lycee.commune,
        uai: lycee.uai
      }
      data[:lycee_filieres] = lycee.filieres.map do |filiere|
        {
          name: filiere.name,
          success_rate: filiere.success_rate,
          mention_rate: filiere.mention_rate,
          tb_mention_rate: filiere.tb_mention_rate,
          ab_mention_rate: filiere.ab_mention_rate,
          b_mention_rate: filiere.b_mention_rate,
          serie: filiere.serie
        }
      end
    end

    return data
  end
end
