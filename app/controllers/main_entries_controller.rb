class MainEntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorized_only

    def update
      @main_entry = MainEntry.find(params[:id])
      if @main_entry.update_attributes(secure_params)
        redirect_to details_path(@main_entry.japanese), :notice => "Comment saved."
      else
        redirect_to details_path(@main_entry.japanese), :alert => "Unable to save comment."
      end
    end

    private

    def authorized_only
      unless current_user.admin? || current_user.vip?
        redirect_to root_path, :alert => "Access denied."
      end
    end

    def secure_params
      params.require(:main_entry).permit(:comment, :dict_comment, :jisho, :buddhdic, :cjk)
    end

  end