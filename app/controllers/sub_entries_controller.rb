class SubEntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorized_only

    def update
      @sub_entry = SubEntry.find(params[:id])
      if @sub_entry.update_attributes(secure_params)
        redirect_to details_path(@sub_entry.japanese), :notice => "Changes saved."
      else
        redirect_to details_path(@sub_entry.japanese), :alert => "Unable to save changes."
      end
    end

    private

    def authorized_only
      unless current_user.admin? || current_user.vip?
        redirect_to root_path, :alert => "Access denied."
      end
    end

    def secure_params
      params.require(:sub_entry).permit(:comment, :dict_comment, :jisho, :buddhdic, :cjk)
    end

  end
