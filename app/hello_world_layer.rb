class HelloWorldLayer < Joybox::Core::Layer

  include Joybox::TMX

  scene

  def on_enter
    tile_map = TileMap.new(:file_name => 'tile_map.tmx')
    tile_layer = tile_map.tile_layers['Background']
    self << tile_layer
  end
end
