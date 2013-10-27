class HelloWorldLayer < Joybox::Core::Layer

  include Joybox::TMX

  scene

  def on_enter
    @tile_map = TileMap.new(:file_name => 'tile_map.tmx')
    tile_layer = @tile_map.tile_layers['Background']
    self << tile_layer

    tile_object = @tile_map.object_layers['Objects']
    spawn_point = tile_object.objectNamed('SpawnPoint')
    p spawn_point.inspect
    p spawn_point.class
    x = spawn_point["x"]
    y = spawn_point["y"]

    player = Sprite.new(:file_name => 'arts/Player.png')
    player.position = jbp(x, y)

    self << player

    center_at(player.position)
  end

end
