<Pml templates="[templates_from_file 'levela/dml_entity.tpml']">
  <Scene
    name="scene"
    camera="mul [ projection { fov: 1.0, far: 1000.0 }, lookat { eye: { x: 4.0, y: 4.0, z: 3.0 }, center: { x: 0.0, y: 0.0, z: 1.0 } } ]"
    animation="key_framed { property: this.sun_z, keys: [{ time: 0.0, value: 0.0 }, { time: 0.5, value: 20.0 }, { time: 1.0, value: 0.0 }], loop: 'forever', duration: 1.0 }"
    sun_z="1.0"
    >
    <DmlEntity
        animation="()"
        shader="shader_program { vertex: shader_from_file 'assets/shaders/basic_vs.glsl', fragment: shader_from_file 'assets/shaders/alpha_tested_fs.glsl' }"
        uniforms="{
          alpha_threshold: 0.5,
          light_direction: vec3 { x: 1.0, y: 1.0, z: @scene.sun_z },
          diffuse_color: vec3 { x: 1.34, y: 1.26, z: 0.8 },
          ambient_color: vec3 { x: 0.4, y: 0.76, z: 0.78 }
        }"
        subdoc="'assets/DeadMeetsLeadContent/Data/Models/Props/Stone1.x'"
        diffuse="texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/Props/Stone1.png'"
      />
  </Scene>
</Pml>
