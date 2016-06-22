$(function() {

  // const class_name = $('.js_thumbnail_preview');

  $('.js_thumbnail_preview').each(function() {
    const self = $(this);
    const input = $(this).find('input[type=file]');
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
        self.css({
          'background-image': 'url(' + fileReader.result + ')'
        });
      };
      fileReader.readAsDataURL(file);
    })
  })
})
