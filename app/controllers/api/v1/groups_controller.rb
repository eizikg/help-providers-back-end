require 'pry'
module Api
  module V1

    class GroupsController < ApplicationController

      def index
         render json: Group.all
      end

      def create
      end

      def update
      end

      def show
       render json: Group.where(id: params["id"])
      end

      def destroy
      end

    end
  end
end
