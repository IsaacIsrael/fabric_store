
function handleSelectImage(event){
  const image = document.querySelectorAll('.gallery-display')[0];

  if (typeof(image) !== 'undefined' && image !== null) {
    image.src = event.target.src
    image.dataset.index = event.target.dataset.index
  }
}


export default function(){
   const gallary = document.getElementById('tab-gallery');

  if (typeof(gallary) !== 'undefined' && gallary !== null) {
    const items = Array.from(gallary.querySelectorAll('.item-gallery'));
    items.map( item => item.onclick = handleSelectImage);
  }
}
