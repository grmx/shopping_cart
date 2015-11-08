class PensController < ApplicationController
  def index
    @pens = Pen.all
  end
end
