class CreateFlaws < ActiveRecord::Migration
  def change
    create_table :flaws do |t|
      t.references :site, index: true
      t.references :user, index: true
      t.integer :refreshes_every

      t.timestamps
    end
  end
end
