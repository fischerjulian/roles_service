require 'rubyvis'

module Organigram
  class RubyVis

    def initialize(orgs)

      @tree_data = {}
      orgs.each do |org|
        @tree_data[org.title] = build_tree_data(org)
      end
    end

    def to_vis

      tree_data = @tree_data

      # tree_data = {
      #   "Executive" => {
      #     "Finances" => "Benjamin",
      #     "Development" => {
      #       "Mobile Development" => "Peter",
      #       "Web Development" => "Rick, Tom"
      #     }
      #   }
      # }

      vis = Rubyvis::Panel.new()
          .width(800)
          .height(800)
          .left(0)
          .right(0)
          .top(0)
          .bottom(0)

      tree = vis.add(Rubyvis::Layout::Tree).
        nodes(Rubyvis.dom(tree_data).root("Company").nodes()).
        orient('radial').
        depth(85).
        breadth(12)

      tree.link.add(Rubyvis::Line)

      tree.node.add(Rubyvis::Dot).
      fill_style(lambda {|n| n.first_child ? "#aec7e8" : "#ff7f0e"}).
      title(lambda {|n| n.node_name})

      tree.node_label.add(Rubyvis::Label).
      visible(lambda {|n| n.first_child})


      vis.render
      vis    
    end

    protected

    def build_tree_data(org)
      puts "\n\nbuilding tree for #{org.title}...\n\n"
      tree_data = {}
      
      if org.child_units.empty? then
        tree_data = org.title
      else
        org.child_units.each do |child_unit|
          tree_data[child_unit.title] = build_tree_data(child_unit)
        end
      end

      tree_data
    end
  end
end

# puts vis.to_svg