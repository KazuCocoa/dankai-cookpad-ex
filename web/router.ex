defmodule Dankai.Router do
  use Dankai.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #               page_path  GET     /                                      Dankai.PageController :index
  #       recipe_image_path  GET     /recipe_images/:id                     Dankai.RecipeImageController :show
  #       recipe_image_path  POST    /recipe_images                         Dankai.RecipeImageController :create
  #               step_path  POST    /steps                                 Dankai.StepController :create
  #             recipe_path  GET     /recipes/:id/edit                      Dankai.RecipeController :edit
  #             recipe_path  GET     /recipes/new                           Dankai.RecipeController :new
  #             recipe_path  GET     /recipes/:id                           Dankai.RecipeController :show
  #             recipe_path  POST    /recipes                               Dankai.RecipeController :create
  #             recipe_path  PATCH   /recipes/:id                           Dankai.RecipeController :update
  #                          PUT     /recipes/:id                           Dankai.RecipeController :update
  #             recipe_path  DELETE  /recipes/:id                           Dankai.RecipeController :delete
  #recipe_recipe_image_path  GET     /recipes/:recipe_id/recipe_images/new  Dankai.RecipeImageController :new
  #        recipe_step_path  GET     /recipes/:recipe_id/steps/new          Dankai.StepController :new
  scope "/", Dankai do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/recipe_images", RecipeImageController, only: [:show, :create]
    resources "/steps", StepController, only: [:create]

    resources "/recipes", RecipeController, except: [:index] do
      resources "/recipe_images", RecipeImageController, only: [:new]
      resources "/steps", StepController, only: [:new]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Dankai do
  #   pipe_through :api
  # end
end
