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

        // Reload the page
        location.reload();
      });
    });
  });

  document.addEventListener('DOMContentLoaded', function() {
    // Set the initial display to none
    var menuSection = document.getElementById('menuSection');
    menuSection.style.display = 'none';
  });

  function toggleMenu() {
    var menuSection = document.getElementById('menuSection');
    menuSection.style.display = menuSection.style.display === 'none' ? 'block' : 'none';
  }

  function closeMenu() {
    var menuSection = document.getElementById('menuSection');
    menuSection.style.display = 'none';
  }