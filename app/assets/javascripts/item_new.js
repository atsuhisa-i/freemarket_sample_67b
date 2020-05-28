$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="file__upload" type="file"
                    name="item[pictures_attributes][${index}][image]"
                    id="item_pictures_attributes_${index}_image">
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div id=preview>
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="js-remove" data-index="${index}">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#files__content__form').on('change', '.file__upload', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#files__content__form').prepend(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('.files__content').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    // 編集画面用
    // const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`#item_pictures_attributes_${targetIndex}_image`).remove();
    $(this).parent().remove();


    if ($('.file__upload').length == 0) $('#files__content__form').append(buildFileField(fileIndex[0]));
  }); 
});




