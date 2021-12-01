import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';

export default function() {

  const tiles = document.querySelectorAll(`div[data-crop-name='VEG']`);
  tiles.forEach(tile => {


    ////////////START
      const scene = new THREE.Scene();
      let camera = new THREE.PerspectiveCamera( 1, window.innerWidth / window.innerHeight, 0.1, 1000 );
      let hemiLight = new THREE.HemisphereLight( 0x0000ff, 0x00ff00, 2 );
      let directionalLight = new THREE.DirectionalLight( 0xffffff, 2 );
      const renderer = new THREE.WebGLRenderer( { alpha: true } );
      renderer.setSize( window.innerWidth, window.innerHeight );

      // camera.position.set(0, 0, 50);
      const loader = new GLTFLoader();

      loader.load('/testcrop2.gltf',
        ( gltf ) => {
        console.log(gltf)
        scene.add( gltf.scene );
        scene.add( directionalLight );
        camera = gltf.cameras[0];
        // scene.background = new THREE.set(0xffffff, 0);
      });

      const animate = function () {
        requestAnimationFrame( animate );
        renderer.render( scene, camera );
      };
      animate();

    ////////// END
    tile.appendChild( renderer.domElement )
  });

  // loader.load('/testcrop1.gltf',
	// // called when the resource is loaded
	// ( gltf ) => {

  //   scene.add( gltf.scene );
  //   scene.background = new THREE.set(0xffffff, 0);
  //   scene.clone(true)
  //   // scene.add(light);
	// },
  // 	// called while loading is progressing
	// function ( xhr ) {

	// 	console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

	// },
	// // called when loading has errors
	// function ( error ) {

	// 	console.log( 'An error happened' );

	// });

}
