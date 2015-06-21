class OrganigramsController < ApplicationController
  def show
    org_unit_roots = OrgUnit.roots
    respond_to do |format|
      format.html { }
      format.svg do
        o = Organigram::RubyVis.new(org_unit_roots)
        vis = o.to_vis
        render text: vis.to_svg
      end
      format.json do   
        o = Organigram::D3s.new(org_unit_roots)
        render text: o.to_json
      end
    end
  end
end
