$(function() {

  const ids = [$('#js_thumbnail_preview'), $('#js_thumbnail_preview_0'), $('#js_thumbnail_preview_1'), $('#js_thumbnail_preview_2'), $('#js_thumbnail_preview_3')];

  $.each(ids, function(i, value) {
    const input = value.find('input[type=file]');
    input.change(function() {
      var file = $(this).prop('files')[0];
      const fileReader = new FileReader();
      if (!this.files.length) {
        window.alert('error!')
      }
      if (!file.type.match('image.*')) {
        window.alert('error!')
      }
      fileReader.onload = function() {
        value.css({
          'background-image': 'url(' + fileReader.result + ')'
        });
      };
      fileReader.readAsDataURL(file);
    })
  })
})
