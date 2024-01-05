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
    it { expect(subject).to validate_presence_of(:status) }
  end

  describe "enum" do
    it { expect(subject).to define_enum_for(:status).with_values({pending:0, in_progress:1, canceled: 2, accomplished: 3}) }
  end
end
