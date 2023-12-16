document.addEventListener("turbo:load", function() {
  const form = document.getElementById("form");
  document.addEventListener("change", function(event) {
    const input = event.target;
    if (input && input.id === "customer_images") {
      if (input.files.length > 0) {
        form.submit();
      }
    }
  });
});