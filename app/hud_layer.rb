class HudLayer < Joybox::Core::Layer

  def on_enter
    @label = Label.new(:text => "0", :font_name => "Verdana-Bold", :font_size => 18)
    @label.color = [0, 0, 0]
    margin = 10
    @label.position = jbp(Screen.width - (@label.contentSize.width / 2) - margin, @label.contentSize.half_height + margin)

    self << @label
  end

  def num_collected_changed(num_collected)
    @label.text = num_collected.to_s
  end
end
