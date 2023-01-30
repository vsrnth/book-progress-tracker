# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :progress_percentage
      t.integer :current_page_number
      t.integer :total_pages

      t.timestamps
    end
  end
end
