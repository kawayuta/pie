class ActsAsVotableMigration < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|

      t.references :votable, :polymorphic => true
      t.references :voter, :polymorphic => true

      t.boolean :vote_flag, default: false, null: false
      t.string :vote_scope
      t.integer :vote_weight

    add_column :presents, :cached_votes_total, :integer, :default => 0
    add_column :presents, :cached_votes_score, :integer, :default => 0
    add_column :presents, :cached_votes_up, :integer, :default => 0
    add_column :presents, :cached_votes_down, :integer, :default => 0
    add_column :presents, :cached_weighted_score, :integer, :default => 0
    add_column :presents, :cached_weighted_total, :integer, :default => 0
    add_column :presents, :cached_weighted_average, :float, :default => 0.0
    add_index  :presents, :cached_votes_total
    add_index  :presents, :cached_votes_score
    add_index  :presents, :cached_votes_up
    add_index  :presents, :cached_votes_down
    add_index  :presents, :cached_weighted_score
    add_index  :presents, :cached_weighted_total
    add_index  :presents, :cached_weighted_average

      t.timestamps
    end

    if ActiveRecord::VERSION::MAJOR < 4
      add_index :votes, [:votable_id, :votable_type]
      add_index :votes, [:voter_id, :voter_type]
    end

    add_index :votes, [:voter_id, :voter_type, :vote_scope]
    add_index :votes, [:votable_id, :votable_type, :vote_scope]
  end

  def self.down
    drop_table :votes
    remove_column :presents, :cached_votes_total
    remove_column :presents, :cached_votes_score
    remove_column :presents, :cached_votes_up
    remove_column :presents, :cached_votes_down
    remove_column :presents, :cached_weighted_score
    remove_column :presents, :cached_weighted_total
    remove_column :presents, :cached_weighted_average

  end
end
