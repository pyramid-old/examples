<Pml
  >
  <Scene
    camera="mul [ projection { fov: 1.0, far: 1000.0 }, lookat { eye: { x: 4.0, y: 4.0, z: 3.0 }, center: { x: 0.0, y: 0.0, z: 1.0 } } ]"
    >
    <Entity
      mesh="box_mesh {}"
      diffuse="static_texture { pixels: [0, 255, 0, 255], width: 1, height: 1 }"
      translation="vec3 { x: -3, y: 0, z: 0 }"
      transform="cached_transform mul [ translate @this.translation ]"
      />
  </Scene>
</Pml>
