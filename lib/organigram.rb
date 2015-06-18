require 'rubyvis'

class Organigram

  def to_vis
    tree_data = {
      "Executive" => {
        "Finances" => "Benjamin",
        "Development" => {
          "Mobile Development" => "Peter",
          "Web Development" => "Rick, Tom"
        }
      }
    }

    vis = Rubyvis::Panel.new()
        .width(400)
        .height(400)
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
end


# puts vis.to_svg