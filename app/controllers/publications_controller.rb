class PublicationsController < ApplicationController
  before_action :current_user_must_be_publication_publication, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_publication_publication
    publication = Publication.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == publication.publication
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @publications = Publication.page(params[:page]).per(10)

    render("publication_templates/index.html.erb")
  end

  def show
    @publication = Publication.find(params.fetch("id_to_display"))

    render("publication_templates/show.html.erb")
  end

  def new_form
    @publication = Publication.new

    render("publication_templates/new_form.html.erb")
  end

  def create_row
    @publication = Publication.new

    @publication.publication_id = params.fetch("publication_id")

    if @publication.valid?
      @publication.save

      redirect_back(:fallback_location => "/publications", :notice => "Publication created successfully.")
    else
      render("publication_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @publication = Publication.find(params.fetch("prefill_with_id"))

    render("publication_templates/edit_form.html.erb")
  end

  def update_row
    @publication = Publication.find(params.fetch("id_to_modify"))

    

    if @publication.valid?
      @publication.save

      redirect_to("/publications/#{@publication.id}", :notice => "Publication updated successfully.")
    else
      render("publication_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_publication
    @publication = Publication.find(params.fetch("id_to_remove"))

    @publication.destroy

    redirect_to("/users/#{@publication.publication_id}", notice: "Publication deleted successfully.")
  end

  def destroy_row
    @publication = Publication.find(params.fetch("id_to_remove"))

    @publication.destroy

    redirect_to("/publications", :notice => "Publication deleted successfully.")
  end
end
