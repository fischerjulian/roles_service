class OrganigramsController < ApplicationController
  def show
     respond_to do |format|
      format.html { }
      format.svg do
        o = Organigram.new(OrgUnit.roots)
        vis = o.to_vis
        render text: vis.to_svg
      end
    end
  end
end
