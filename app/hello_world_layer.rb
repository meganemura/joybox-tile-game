class HelloWorldLayer < Joybox::Core::Layer

  include Joybox::TMX

  scene

  def on_enter
    @tile_map = TileMap.new(:file_name => 'tile_map.tmx')
    tile_layer = @tile_map.tile_layers['Background']
    self << tile_layer

    tile_object = @tile_map.object_layers['Objects']
    spawn_point = tile_object.objectNamed('SpawnPoint')
    x = spawn_point["x"]
    y = spawn_point["y"]

    @player = Sprite.new(:file_name => 'arts/Player.png')
    @player.position = jbp(x, y)

    self << @player

    center_at(@player.position)

    on_touches_ended do |touches, event|
      touch = touches.any_object
      location = self.convertTouchToNodeSpace(touch)

      position = @player.position
      diff = jbpSub(location, position)

      if diff.x.abs > diff.y.abs
        if diff.x > 0
          position.x += @tile_map.tile_size.width
        else
          position.x -= @tile_map.tile_size.width
        end
      else
        if diff.y > 0
          position.y += @tile_map.tile_size.height
        else
          position.y -= @tile_map.tile_size.height
        end
      end

      # safety check on the bounds of the map
      if (position.x <= (@tile_map.tiles_size.width * @tile_map.tile_size.width) &&
          position.y <= (@tile_map.tiles_size.height * @tile_map.tile_size.height) &&
          position.x >= 0 &&
          position.y >= 0)
        @player.position = position
      end

      center_at(@player.position)
    end
  end

end
