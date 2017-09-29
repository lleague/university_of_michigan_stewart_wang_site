class AddFirstAuthorAndLastAuthorToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :first_author, :string
    add_column :publications, :last_author, :string    
  end
end
