class InventoriesController < ApplicationController
    get "/inventories" do
        erb :'inventories/index'
    end
end