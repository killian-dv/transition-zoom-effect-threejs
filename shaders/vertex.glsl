uniform float time;
uniform float uProgress;
uniform vec2 uResolution;
uniform vec2 uQuadSize;
uniform vec4 uCorners;
varying vec2 vSize;
varying vec2 vUv;

void main () {
  float PI = 3.141592653589793238;
  vUv = uv;
  float sine = sin(PI*uProgress);
  float waves = sine*0.1*sin(5.*length(uv) + 10.*uProgress); // Modify the value multiplied to uProgress to change the number of the waves
  vec4 defaultState = modelMatrix*vec4( position, 1.0);
  vec4 fullSreenState = vec4( position, 1.0);
  fullSreenState.x *= uResolution.x;
  fullSreenState.y *= uResolution.y;
  float cornersProgress = mix(mix(uCorners.z, uCorners.w, uv.x), mix(uCorners.x, uCorners.y, uv.x), uv.y);

  vec4 finalState = mix(defaultState, fullSreenState, cornersProgress);

  vSize = mix(uQuadSize, uResolution, cornersProgress);
  gl_Position = projectionMatrix * viewMatrix * finalState ;
}