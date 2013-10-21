$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('form').submit(function(event) {
    event.preventDefault();
    // make data equal to username field
    var data = this.username.value;

    var url = '/' + data;
    var response = function(response) {
        $('.response').html(response);
    }

    $('.response').html("WHOOOO");


    // function(response) == what's returned from page
    $.get(url, response)

  })

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
