# To be used with:
# https://developers.google.com/chart/interactive/docs/gallery/orgchart?csw=1#example
#
# Structure required by example:
#   [
#   [{v:'Mike', f:'Julian Fischer<div style="color:red; font-style:italic">CEO</div>'}, '', 'The CEO'],
#   [{v:'Jim', f:'Jim<div style="color:red; font-style:italic">Vice President</div>'}, 'Mike', 'VP'],
#   ['Alice', 'Mike', ''],
#   ['Bob', 'Jim', 'Bob Sponge'],
#   ['Carol', 'Bob', ''],
#   ['Hektor', 'Carol', ''],
# ]
module Organigram
  class Google
    def initialize(orgs)
      @data = []

      # https://developers.google.com/chart/interactive/docs/gallery/orgchart?csw=1#example
      orgs.each do |org|
        add_org(org)
      end
    end

    def to_json
      @data.to_json
    end

    protected

    def add_org(org)
      @data << [{"v" => org.id.to_s, "f" => org_to_html(org)}, org.parent_unit ? org.parent_unit.id.to_s : nil, org.description]
      org.child_units.each do |child|
        add_org(child)
      end
    end

    def org_to_html(org)
      html = org.title

      if org.responsible_roles.present? then
        org.responsible_roles.each do |role|
          role.employees.each do |employee|
            html += '<div style="color:red; font-style:italic">'
            html += employee.name
            html += '</div>'
          end
        end
      end
    html
    end
  end
end
