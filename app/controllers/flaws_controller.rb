class FlawsController < ApplicationController
  def create
    @flaw = current_user.flaws.create flaw_params

    respond_to do |format|
      if @flaw.save
        format.html { redirect_to current_user, notice: 'FLaW added.' }
        format.js
      else
        format.html { redirect_to current_user, error: 'Unable to save FLaW.  Please try again.'}
        format.js { render 'error' }
      end
    end
  end

  private

  def flaw_params
    params.require(:flaw).permit(:recurs_every, :site_name)
  end
end
