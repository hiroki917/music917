document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('message_image')){
  const ImageList = document.getElementById('image-list');
  document.getElementById('message_image').addEventListener('change', function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  });
 }
});