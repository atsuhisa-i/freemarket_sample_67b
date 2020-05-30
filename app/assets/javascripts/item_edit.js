$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group_edit">
                    <input class="file__upload__edit" type="file"
                    name="item[pictures_attributes][${index}][image]"
                    id="item_pictures_attributes_${index}_image">
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div id="preview__edit">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="js-remove" data-index="${index}">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.js-file_group_edit:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('label.change__form-id').on('mouseover', '#files__content__form__edit', function(e) {
    let targetIndex = $('.js-file_group_edit:last').data('index');
    $('label.change__form-id').attr('for', `item_pictures_attributes_${targetIndex}_image`)
  })

  $('#files__content__form__edit').on('change', '.file__upload__edit', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {
      $('#previews__edit').append(buildImg(targetIndex, blobUrl));
      $('#files__content__form__edit').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length -1 ] + 1)
    }
  });

  $('.files__content__edit').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`#item_pictures_attributes_${targetIndex}_image`).remove();
    $(this).parent().remove();

    if ($('.file__upload__edit').length == 0) $('#files__content__form__edit').append(buildFileField(fileIndex[0]));
  }); 
});

