<Pml templates="[templates_from_file 'levela/dml_entity.tpml']">
  <Scene
    camera="mul [ projection { fov: 1.0, far: 1000.0 }, lookat { eye: { x: 4.0, y: 4.0, z: 3.0 }, center: { x: 0.0, y: 0.0, z: 1.0 } } ]"
    >
    <DmlEntity
        animation_Idle1="()"
        _animation="@this.animation_Idle1"
        shader="shader_program { vertex: shader_from_file 'assets/basic_vs.glsl', fragment: shader_from_file 'assets/alpha_tested_fs.glsl' }"
        uniforms="{ alpha_threshold: 0.5 }"
        directx_x="'assets/DeadMeetsLeadContent/Data/Models/Units/Rotten1.x'"
        diffuse="texture_from_file 'assets/DeadMeetsLeadContent/Data/Models/Units/Rotten1.png'"
      />
  </Scene>
</Pml>
