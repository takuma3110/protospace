$(function() {

  var ids = [$('#js_thumbnail_preview'), $('#js_thumbnail_preview_0'), $('#js_thumbnail_preview_1'), $('#js_thumbnail_preview_2'), $('#js_thumbnail_preview_3')];

  $.each(ids, function() {
    var self = $(this)
    let input = $(this).find('input[type=file]');
    input.change(function() {
      let file = $(this).prop('files')[0];
      let fileReader = new FileReader();
      if (!this.files.length) {
        window.alert('error!')
      }
      if (!file.type.match('image.*')) {
        window.alert('error!')
      }
      fileReader.onload = function() {
        self.css({
          'background-image': 'url(' + fileReader.result + ')'
        });
      };
      fileReader.readAsDataURL(file);
    })
  })
})
