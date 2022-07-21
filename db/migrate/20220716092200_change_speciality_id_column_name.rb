class ChangeSpecialityIdColumnName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :profiles, :speciality_id, :doctor_speciality_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
