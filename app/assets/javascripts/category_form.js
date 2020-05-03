$(document).on('turbolinks:load', function(){
  function buildHTML() {
    var html = `<select id="category" name="item[category]"><option value="">選択してください</option>
                  <option value="${child.id}">${child.name}</option>`
    return html;
    }

  $("#category").on("change",function(){
    var parentValue = document.getElementById("category").value;
    $.ajax({
      url: '/items/search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data)
      $('#category').append(html)
    })
    .fail(function(){
      alert('カテゴリーを取得できませんでした')
    })
  })
})