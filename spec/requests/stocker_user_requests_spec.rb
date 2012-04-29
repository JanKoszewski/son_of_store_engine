require 'spec_helper'

describe User do
  msg = "Store Stocker works with products like a store admin
         https://www.pivotaltracker.com/story/show/28489033"

  let! (:user) { Fabricate(:user, :role => "stocker") }
  let! (:second_user) { Fabricate(:user, :role => "stocker")   }
  let! (:store) { Fabricate(:store, :users => [user, second_user]) }
  let! (:product) { Fabricate(:product, :store => store) }

  before(:each) do
    visit products_path(store)
    login_as(user)
  end

  context "with role stocker can" do
    it "view a store's products at the stocker url" do
      page.should have_content(product.title)
    end

    context "create products" do
      it "for the associated store"
        
      it "and after creation view a list of products with a confirmation"
    end

    context "edit products" do
      it "for the associated store"
      it "and after editing view a list of products with a confirmation"
    end

    context "retire products" do
      it "for the associated store"
      it "and after retiring view a list of products with a confirmation"
    end
  end

end
