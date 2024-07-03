class CreateNarutoWords < ActiveRecord::Migration[7.1]
  def change
    create_table :naruto_words do |t|
      t.text :word

      t.timestamps
    end
  end
end
