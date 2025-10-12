class HealthController < ApplicationController
  def check
    render plain: "OK"
  end
end
