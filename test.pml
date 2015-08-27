<Pml>
  <Blueprint
    name="Triangle"
    mesh="static_mesh {
      vertices: [0.0, 0.5, 0.0, 0.0, 0.0,
                 0.5, -0.5, 0.0, 1.0, 0.0,
                -0.5, -0.5, 0.0, 1.0, 1.0],
      indices: [0, 1, 2]
    }"
    />
  <Blueprint
    name="Rectangle"
      animation="key_framed { property: this.z, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 1.0 }, { time: 1.0, value: 0.0 }], loop: 'forever' }"
      z="0.0"
    mesh="static_mesh {
      vertices: [-0.5, 0.5, 0.0, 0.0, 0.0,
                  @this.z, 0.5, 0.0, 1.0, 0.0,
                  0.5, -0.5, 0.0, 1.0, 1.0,
                  -0.5, -0.5, 0.0, 0.0, 1.0],
      indices: [0, 1, 2, 2, 3, 0]
    }"
    />
  <Scene
    animation="key_framed { property: this.z, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 1.0 }, { time: 1.0, value: 0.0 }], loop: 'forever' }"
    z="0.0"
    transform="mul [ projection { fov: 1.0 }, lookat { eye: { x: 1.0, y: 1.0, z: @this.z }, center: { x: 0.0, y: 0.0, z: 0.0 } } ]">
    <Entity
      mesh="mesh_from_file 'assets/Barrel1.x'"
      texture="texture_from_file 'assets/Barrel1.png'"
      _texture="texture_from_file 'assets/kitten.jpg'"
      transform="mul [ @parent.transform, translate { x: 0.0, y: 0.0, z: 0.0 }, scale { x: 0.1, y: 0.1, z: 0.1 } ]" />
    <Triangle
      name="tmp"
      animation="key_framed { property: this.pos_y, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 1.0 }, { time: 1.0, value: 0.0 }], loop: 'forever' }"
      pos_y="0.0"
      transform="mul [ @parent.transform, translate { x: 1.0, y: @this.pos_y, z: 0.0 } ]" />
    <Triangle
      name="tmp2"
      transform="mul [ @parent.transform, translate { x: @tmp.pos_y, y: -1.0, z: 0.0 } ]"
      texture="static_texture { pixels: [0, 255, 0, 255, 0, 0, 255, 255, 255, 0, 0, 255, 255, 255, 0, 255], width: 2, height: 2 }" />
    <Rectangle
      transform="translate { x: 0.0, y: 1.0, z: 0.0 }"
      texture="static_texture { pixels: [0, 255, 0, 255, 0, 0, 255, 255, 255, 0, 0, 255, 255, 255, 0, 255], width: 2, height: 2 }"/>
    <Rectangle
      transform="translate { x: 0.0, y: 0.0, z: 0.9 }"
      texture="texture_from_file 'assets/kitten.jpg'"/>
  </Scene>
</Pml>
