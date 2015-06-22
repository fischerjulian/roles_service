class OrganigramsController < ApplicationController
  def show
    org_unit_roots = OrgUnit.roots
    respond_to do |format|
      format.html { }
      format.json do   
        o = Organigram::Google.new(org_unit_roots)
        render text: o.to_json
      end
    end
  end

  def diagram
  end
end
