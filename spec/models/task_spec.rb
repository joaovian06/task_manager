require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "columns" do
    it { expect(subject).to have_db_column(:name) }
    it { expect(subject).to have_db_column(:description) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end
end
