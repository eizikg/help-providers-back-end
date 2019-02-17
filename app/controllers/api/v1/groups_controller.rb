require 'pry'
module Api
  module V1

    class GroupsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      before_action :authenticate_request!
      skip_before_action :authenticate_request!, only: [:index, :create, :show]

      def index
        @group=Group.all
         render json: Group.all, each_serializer: GroupAllSerializer
      end

      def create
        this_params = group_params
        @volounteer = Volounteer.find(params[:volounteer_id])
        this_params['lat']=@volounteer.lat
        this_params['lng']=@volounteer.lng
        # binding.pry
        @group= Group.create(this_params)
        GroupVolounteer.create(group_id: @group.id, volounteer_id: params[:volounteer_id], is_admin: true)
        # @group.save
        render json: @group, serializer: GroupAllSerializer
      end

      def update
        @group=Group.find(params[:id])
        @group.update(group_params)
        render json: @group
      end

      def show
        # binding.pry
       render json: Group.where(id: params["id"]), each_serializer: GroupSerializer
       # Group.where(id: params["id"], joins: [GroupVolounteer, Volounteer])
      end

      def destroy
        @group=Group.find(params[:id])
        render json: @group.destroy
      end

      private

        def group_params
          params.permit(:id, :description, :name, :category_id)
        end

    end
  end
end
