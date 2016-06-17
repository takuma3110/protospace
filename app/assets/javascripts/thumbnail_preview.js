$(function() {
  $('.thumbnail_preview').each(function() {
    var self = $(this);
    var input = self.find('input[type=file]');
    input.change(function() {
      var file = $(this).prop('files')[0];
      var fileReader = new FileReader();
      if (!this.files.length) {
        return
      }
      if (!file.type.match('image.*')) {
        return
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
