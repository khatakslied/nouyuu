import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';

const assetMapping = {
    "Amaranthaceae": "/amaranthaceae.glb",
    "Brassicaceae": "/brassicaceae.glb",
    "Cucurbitaceae": "/cucurbitaceae.glb",
    "Ericaceae": "/ericaceae.glb",
    "Liliaceae": "/liliaceae.glb",
    "Solanaceae": "/solanaceae.glb",
    "Asparagaceae": "/herb.glb",
    "Asteraceae": "/herb.glb",
    "Convolvulaceae": "/herb.glb",
    "Fabaceae": "/herb.glb",
    "Grossulariaceae": "/herb.glb",
    "Lamiaceae": "/herb.glb",
    "Malvaceae": "/herb.glb",
    "Passifloraceae": "/herb.glb",
    "Poaceae": "/herb.glb",
    "Rosaceae": "/herb.glb",
    "Umbelliferae": "/herb.glb",
    'Zingiberaceae': "/herb.glb"
}

export default function() {


  const tiles = document.querySelectorAll(``);
  tiles.forEach(tile => {

    const renderer = new THREE.WebGLRenderer( { alpha: true } );
    renderer.setSize( window.innerWidth, window.innerHeight );
    const scene = new THREE.Scene();
    let camera = new THREE.PerspectiveCamera( 1, window.innerWidth / window.innerHeight, 0.1, 1000 );
    const light = new THREE.AmbientLight( 0x404040, 5 );

    if (assetMapping[tile.dataset.cropFamily]) {

      const loader = new GLTFLoader();

      loader.load(assetMapping[tile.dataset.cropFamily],
        ( gltf ) => {
        scene.add( gltf.scene );
        scene.add( light );
        camera = gltf.cameras[0];
      });

    }

      tile.appendChild( renderer.domElement )
      const animate = function () {
        requestAnimationFrame( animate );
        renderer.render( scene, camera );
      };
      animate();
    });

}
