class IcamController < ApplicationController
      def show
        render template: "icam/#{params[:icam]}"
      end
    end
