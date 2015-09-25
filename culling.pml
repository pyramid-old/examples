<Pml>
  <Scene
    projection="projection { fov: 1.0, far: 1000.0 }"
    view="lookat { eye: { x: 4.0, y: 4.0, z: 3.0 }, center: { x: 0.0, y: 0.0, z: 1.0 } }"
    camera="mul [ @this.projection, @this.view ]"
    frustum="frustum_from_camera {
      projection: @this.projection,
      view: @this.view
    }"
    >
    <Entity
      mesh="box_mesh {}"
      diffuse="static_texture { pixels: [0, 255, 0, 255], width: 1, height: 1 }"
      />
    <Entity
      mesh="box_mesh {}"
      diffuse="static_texture { pixels: [0, 255, 0, 255], width: 1, height: 1 }"
      cullable="culling {
        frustum: @scene.frustum,
        bounding: vec3 { x: 0, y: 0, z: 0 },
        transform: @this.transform
      }"
      translate="vec3 { x: -3, y: 0, z: 0 }"
      transform="mul [ translate @this.translation ]"
      />
  </Scene>
</Pml>
