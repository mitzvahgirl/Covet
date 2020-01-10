class InventoriesController < ApplicationController
    before do
        redirect '/login' unless session[:username]
    end
    
    get "/categories/:id/inventories/new" do
        erb :'inventories/new'
    end

    post "/categories/:id/inventories" do
        category = Category.find(params[:id])
        inventory = category.inventories.build(name: params[:name], description: params[:description])
        inventory.user_id = current_user.id
        if inventory.save
            flash.now[:success] = "inventory created!"
            redirect "/categories/#{params[:id]}"
        else
            @errors = inventory.errors
            flash.now[:error] = "Error creating inventory"
            redirect "/categories/<%= params[:id] %>/inventories/new"
        end
    end

   get "/categories/:id/inventories/:inventory_id/edit" do
        @inventory = Inventory.find(params[:inventory_id])
        erb :"inventories/edit"
    end  

    put "/categories/:id/inventories/:inventory_id" do
        inventory = Inventory.find(params[:inventory_id])
        if inventory.update_attributes({name: params[:name], description: params[:description]})
            flash.now[:success] = "inventory updated!"
            redirect "/categories/#{params[:id]}"
        else
            @errors = inventory.errors
            flash.now[:error] = "Error updating inventory"
            redirect "/categories/<%= params[:id] %>/inventories/<%= params[:inventory_id] %>/edit"
        end        
    end

    get "/categories/:id/inventories/:inventory_id/delete" do
        inventory = Inventory.find(params[:inventory_id])
        if inventory.destroy
            flash.now[:success] = "inventory deleted!"
            redirect "/categories/#{params[:id]}"
        else
            @errors = inventory.errors
            flash.now[:error] = "Error deleting inventory"
        end
        redirect "/categories/#{params[:id]}"       
    end    
end