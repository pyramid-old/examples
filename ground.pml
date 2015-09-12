<Pml templates="[templates_from_file 'levela/dml_entity.tpml']">
  <Scene
    animation="key_framed { property: this.z, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 20.0 }, { time: 1.0, value: 0.0 }], loop: 'forever', duration: 10.0 }"
    z="0.0"
    camera="mul [ projection { fov: 1.0, far: 1000.0 }, lookat { eye: { x: 85.0, y: 140.0, z: @this.z }, center: { x: 95.0, y: 150.0, z: 0.0 } } ]"
    >
    <Entity
      shader="shader_program { vertex: shader_from_file 'assets/shaders/ground_vs.glsl', fragment: shader_from_file 'assets/shaders/ground_fs.glsl' }"
      mesh="grid_mesh { n_vertices_width: 300, n_vertices_height: 300 }"
      textures="{
        splat1: texture_from_file 'levela/splat1.png',
        splat2: texture_from_file 'levela/splat2.png',
        base: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Mud1.png',
        diffuse1: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Rock1.png',
        diffuse2: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Pebbles1.png',
        diffuse3: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Sand1.png',
        diffuse4: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Grass1.png',
        diffuse5: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Moss1.png',
        diffuse6: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Mayatile1.png',
        diffuse7: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Field1.png',
        diffuse8: texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/GroundTextures/Sand1.png',
        heightmap: texture_from_file 'levela/heightmap.dhm'
      }"
      transform="scale { x: 200.0, y: 200.0, z: 3.0 }" />
  </Scene>
</Pml>
