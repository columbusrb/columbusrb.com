class RemoveClasses < ActiveRecord::Migration
  def up
    # Nix classes.
    Meeting.where(format: "Class").all.each{|m| m.format="Lecture"; m.save}
  end

  def down
  end
end
