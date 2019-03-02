class MembershipSubmissionsController < ApplicationController
  def new
    @submission = SlackMembershipSubmission.new
  end

  def create
    redirect_to root_path and return if submission_params.key?(:fax)

    @submission = SlackMembershipSubmission.new(submission_params)

    if @submission.save
      flash[:info] = "Terima kasih! Tunggu email dari kami dalam beberapa hari."
      redirect_to root_path
      return
    end

    flash[:danger] = "Ada masalah dengan pengajuan Anda. Mohon coba lagi."
    render action: :new
  end

  private

  def submission_params
    params.require(:slack_membership_submission).
      permit(:first_name, :last_name, :email, :location, 
             :website_url, :github_url, :linkedin_url, :introduction, :fax)
  end
end
