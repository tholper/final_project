Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "publications#index"
  # Routes for the Publication resource:

  # CREATE
  get("/publications/new", { :controller => "publications", :action => "new_form" })
  post("/create_publication", { :controller => "publications", :action => "create_row" })

  # READ
  get("/publications", { :controller => "publications", :action => "index" })
  get("/publications/:id_to_display", { :controller => "publications", :action => "show" })

  # UPDATE
  get("/publications/:prefill_with_id/edit", { :controller => "publications", :action => "edit_form" })
  post("/update_publication/:id_to_modify", { :controller => "publications", :action => "update_row" })

  # DELETE
  get("/delete_publication/:id_to_remove", { :controller => "publications", :action => "destroy_row" })
  get("/delete_publication_from_publication/:id_to_remove", { :controller => "publications", :action => "destroy_row_from_publication" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
