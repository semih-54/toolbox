
document.addEventListener('DOMContentLoaded', function() {
  const toggleButton = document.getElementById('toggle_button');

  toggleButton.addEventListener('click', function(e) {
    e.preventDefault();

    const toggleStatus = this.getAttribute('data-toggle-status');

    if (toggleStatus === 'off') {
      this.setAttribute('data-toggle-status', 'on');

    } else {
      this.setAttribute('data-toggle-status', 'off');
    }
  });
});
