require 'rails_helper'

RSpec.describe Publication, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:publication) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
