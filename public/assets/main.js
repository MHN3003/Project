'use strict';

window.onscroll = function() {scrollFunction()};
    function scrollFunction() {
        var navbar = document.getElementById("navbar");
        if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            navbar.classList.add("changed");
        } else {
            navbar.classList.remove("changed");
        }
    }

      // Password toggle functionality
      var passwordInput = document.getElementById('password');
      var passwordToggle = document.querySelector('.password-toggle');
      passwordToggle.addEventListener('click', function() {
        if (passwordInput.type === 'password') {
          passwordInput.type = 'text';
          passwordToggle.classList.remove('fa-eye-slash');
          passwordToggle.classList.add('fa-eye');
        } else {
          passwordInput.type = 'password';
          passwordToggle.classList.remove('fa-eye');
          passwordToggle.classList.add('fa-eye-slash');
        }
      });
    
