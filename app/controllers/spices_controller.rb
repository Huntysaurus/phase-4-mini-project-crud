class SpicesController < ApplicationController

    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end
    
    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # GET/spices/:id
    def show
        spice = found_spice
        render json: spice
    end

    # PATCH/spices/:id
    def update
        spice = found_spice
        spice.update(spice_params)
        render json: spice 
    end
    
    # DELETE/spices/:id
    def destroy
        spice = found_spice
        spice.destroy
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def found_spice
        Spice.find(params[:id])
    end

end
