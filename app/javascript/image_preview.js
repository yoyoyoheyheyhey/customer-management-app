document.addEventListener("DOMContentLoaded", function() {
  const input = document.getElementById("image-upload");
  console.log(input);
  const existing = document.getElementById("existing");
  const preview =  document.getElementById("preview");

  input.addEventListener("change", function() {
    const file = this.files[0];
    if (file) {
      const reader = new FileReader();

      reader.onload = function(e) {
        existing.classList.add("hidden")
        preview.innerHTML = '<img class="border border-gray-300 rounded-full w-40 h-40" src="' + e.target.result + '" />';
      };

      reader.readAsDataURL(file);
    }
  });
});
