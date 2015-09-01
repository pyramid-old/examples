<Pml templates="[templates_from_file 'levela/dml_entity.tpml']">
  <Scene
    animation="key_framed { property: this.z, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 10.0 }, { time: 1.0, value: 0.0 }], loop: 'forever', duration: 10.0 }"
    z="0.0"
    camera="mul [ projection { fov: 1.0, far: 1000.0 }, lookat { eye: { x: 4.0, y: 4.0, z: @this.z }, center: { x: 0.0, y: 0.0, z: 0.0 } } ]"
    >
    <Entity
      shader="shader_program { vertex: shader_from_file 'assets/ground_vs.glsl', fragment: shader_from_file 'assets/ground_fs.glsl' }"
      mesh="grid_mesh { n_vertices_width: 300, n_vertices_height: 300 }"
      diffuse="texture_from_file 'levela/splat1.png'"
      textures="{ diffuse: @this.diffuse, heightmap: texture_from_file 'levela/heightmap.dhm' }"
      transform="scale { x: 3.0, y: 3.0, z: 1.0 }" />
  </Scene>
</Pml>
