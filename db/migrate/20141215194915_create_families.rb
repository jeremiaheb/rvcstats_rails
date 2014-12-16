class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
    	t.string :family_name
    	t.string :common_name
    	t.integer :family_nr
      t.timestamps
    end
  end
end
