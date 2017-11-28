class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.column :response, :string
      t.column :user_id, :integer
      t.column :question_id, :integer
      t.timestamps
    end
  end
end
