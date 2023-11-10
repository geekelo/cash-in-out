//= require_tree .


// In your application.js or inline script
document.addEventListener('DOMContentLoaded', function() {
    // Select all elements with the 'alert' class
    var alerts = document.querySelectorAll('.popups');
  
    // Add a click event listener to each alert
    alerts.forEach(function(alert) {
      alert.addEventListener('click', function() {
        // Hide the clicked alert
        this.style.display = 'none';
      });
    });
  });

  // document.addEventListener('DOMContentLoaded', function() {
  //   // Select all elements with the 'popups' class
  //   var popups = document.querySelectorAll('.popups');
  
  //   // Hide the popups on page load
  //   popups.forEach(function(popup) {
  //     popup.style.display = 'none';
  //   });
  // });