class AnnouncementsController < ApplicationController
  before_action :init_class

  def index
    @announcements = @announcement.fetch_all
  end

  def create
    @announcement.add(params[:text], params[:posted_by], params[:expire])
    redirect_to announcements_path
  end

  private

  def init_class
    @announcement = Announcement.new
  end
end
