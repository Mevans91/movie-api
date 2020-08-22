class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.belongs_to :movie
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
