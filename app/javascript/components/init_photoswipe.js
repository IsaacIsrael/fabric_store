import 'photoswipe/dist/photoswipe.css'
import 'photoswipe/dist/default-skin/default-skin.css'
import PhotoSwipe  from 'photoswipe';
import PhotoSwipeUI_Default from 'photoswipe/dist/photoswipe-ui-default'


const openPhotoSwipe = function(index = 0) {
  console.log('init openPhotoSwipe');
  const pswpElement = document.querySelectorAll('.pswp')[0];
  if (typeof(pswpElement) === 'undefined' && pswpElement === null) {
    return
  }

  // build items array
  const items = JSON.parse(pswpElement.dataset.images).map(item =>{
    return {
      src: item.url,
      w: 0,
      h: 0
    }
  });

  // define options (if needed)
  const options = {
           // history & focus options are disabled on CodePen
      index: index,
      history: false,
      focus: false,
      shareEl: false,

      showAnimationDuration: 0,
      hideAnimationDuration: 0

  };

  const gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);


  gallery.listen('gettingData',(index, item) => {
    if (item.w < 1 || item.h < 1) { // unknown size
      const img = new Image();

      img.onload = function() { // will get size after load
        item.w = this.width; // set image width
        item.h = this.height; // set image height
          gallery.invalidateCurrItems(); // reinit Items
          gallery.updateSize(true); // reinit Items
      }
      img.src = item.src; // let's download image
    }
  });

  gallery.init();
};

export default function(){
  console.log('init PhotoSwipe');
  const btnPswp = document.getElementById('btn-pswp');

  if (typeof(btnPswp) !== 'undefined' && btnPswp !== null) {
    btnPswp.onclick = ()=>openPhotoSwipe(parseInt(btnPswp.dataset.index));
  }
}








