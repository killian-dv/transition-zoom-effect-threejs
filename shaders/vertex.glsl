uniform float time;
uniform float uProgress;
uniform vec2 uResolution;
uniform vec2 uQuadSize;
varying vec2 vSize;
varying vec2 vUv;

void main () {
  vUv = uv;
  vec4 defaultState = modelMatrix*vec4( position, 1.0);
  vec4 fullSreenState = vec4( position, 1.0);
  fullSreenState.x *= uResolution.x/uQuadSize.x;
  fullSreenState.y *= uResolution.y/uQuadSize.y;

  vec4 finalState = mix(defaultState, fullSreenState, uProgress);

  vSize = mix(uQuadSize, uResolution, uProgress);
  gl_Position = projectionMatrix * viewMatrix * finalState ;
}