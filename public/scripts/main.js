






// var Timer = function(){
//   this.$el = $('.time')
//   this.formats = [
//     "hh:mm A", "MMMM DD", "w"
//   ];
//   this.dataFormat = 0;
// }

// Timer.prototype.render = function(event) {
//   var display = moment().format(this.formats[this.dataFormat])
//   this.$el.text(display);
// }

// Timer.prototype.init = function(){
//   this.$el.on('click', this.click.bind(this));
//   window.setInterval(this.render.bind(this), 1000);
// }

// Timer.prototype.click = function(event) {
//   if (this.dataFormat  < this.formats.length - 1) {
//     this.dataFormat = this.dataFormat + 1;
//   } else {
//     this.dataFormat = 0;
//   }
//   this.render();
// }

// $(document).ready(function(){
//   var timer = new Timer();
//   timer.init();
//   $('.greeting').on('click', function(){
//     $('.task-form').show();
//   })
// })
