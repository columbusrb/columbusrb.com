class RemoveClasses < ActiveRecord::Migration[5.0]
  def up
    # Nix classes.
    Meeting.where(format: "Class").all.each{|m| m.format="Lecture"; m.save}
  end

  def down
  end
end
