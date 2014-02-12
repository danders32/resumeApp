class AddIndexesToResumes < ActiveRecord::Migration
  def change
    add_index :resumes, :zip
  end
end
