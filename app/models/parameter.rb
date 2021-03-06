class Parameter < ActiveRecord::Base
  # Relationships
  belongs_to :animal

 # Validations
 validates :length_at_capture, :allow_blank => true,
  :numericality => {
    :greater_than => 0
  }

  validates :length_at_maturity, :allow_blank => true,
   :numericality => {
     :greater_than => 0
   }

   validates :wlen_a, :allow_blank => true,
    :numericality => true

    validates :wlen_b, :allow_blank => true,
     :numericality => true

    validates :animal_id, :presence => true,
     :uniqueness => true,
     :numericality => {
       :only_integer => true
     }
  # Scopes
  scope :with_species, -> species {joins(:animal).where(:animals =>
    {species_cd: species}) if species.present?}
end
